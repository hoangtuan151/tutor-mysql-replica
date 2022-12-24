import hashlib
import json
import time
import uuid

from kazoo.client import KazooClient
from kazoo.handlers.gevent import SequentialGeventHandler
from sqlalchemy import insert, select
from sqlalchemy.ext.asyncio import AsyncEngine, AsyncSession, create_async_engine

from db_model import TblUsers
from utils import Const, logger

# zk = KazooClient(hosts=Const.ZK_URI, handler=SequentialGeventHandler())
zk = KazooClient(hosts="127.0.0.1:12181")
zk.start()

MOD_SHARD = None


@zk.DataWatch("/pinter/modshard")
def zk_watch_callback(data, stat):
    logger.info(">>> CALBACK")
    if stat is not None:
        global MOD_SHARD
        MOD_SHARD = json.loads(data.decode("utf-8"))
        logger.info(f"version: {stat.version}, data: {MOD_SHARD}")


async def init_zk():
    zk.start_async().wait(timeout=5)
    if not zk.connected:
        zk.stop()
        raise Exception("Unable to connect Zookeeper")
    zk.get_async("/pinter/modshard", watch=zk_watch_callback)


def _get_mod_shard(buff: bytes) -> int:
    return int(hashlib.sha512(buff).hexdigest(), 16) % Const.TOTAL_MOD_SHARDS


def _get_host_for_mod_shard(mod_shard: int):
    db_host = None
    for r in MOD_SHARD:
        if r["range"][0] <= mod_shard + 1 and mod_shard + 1 <= r["range"][1]:
            db_host = r["master"]
            break
    return db_host


async def find_user_by_username(username: str):
    # find mod shard (0-based index)
    mod_shard = _get_mod_shard(username.encode("utf-8"))
    logger.info(f"calculate mod shard for user '{username}' got: {mod_shard}")

    # find host of the shard
    db_host = _get_host_for_mod_shard(mod_shard)
    logger.info(f"got db_host: {db_host}")

    engine: AsyncEngine = create_async_engine(
        f"mysql+asyncmy://root@{db_host}/{Const.MOD_SHARD_DBNAME}", echo=True
    )

    sess: AsyncSession
    user = None
    async with engine.connect() as sess:
        query = select([TblUsers]).where(TblUsers.c.username == username)
        user = (await sess.execute(query)).first()
        logger.info(f"row: {user}")

    await engine.dispose()
    return user


async def insert_user(username: str, display_name: str):
    mod_shard = _get_mod_shard(username.encode("utf-8"))
    db_host = _get_host_for_mod_shard(mod_shard)

    engine: AsyncEngine = create_async_engine(
        f"mysql+asyncmy://root@{db_host}/{Const.MOD_SHARD_DBNAME}", echo=True
    )

    user_obj = {
        "username": username,
        "user_id": str(uuid.uuid4()),
        "display_name": display_name,
        "mod_shard": mod_shard,
    }
    async with engine.begin() as sess:
        await sess.execute(insert(TblUsers).values(**user_obj))

    await engine.dispose()
    return user_obj

import asyncio
import hashlib
import json
import time
import uuid
from random import randint, randrange, seed

from kazoo.client import KazooClient
from kazoo.handlers.gevent import SequentialGeventHandler
from sqlalchemy import desc, insert, select, text
from sqlalchemy.ext.asyncio import AsyncEngine, AsyncSession, create_async_engine

from db_model import ModUserData, ShardPins, ShardUserHasPins, ShardUsers
from rest_model import UserProfileResponse
from utils import Const, logger

seed(time.time())
# zk = KazooClient(hosts=Const.ZK_URI, handler=SequentialGeventHandler())
zk = KazooClient(hosts="127.0.0.1:12181")
zk.start()

MOD_SHARD = None
DATA_SHARD = None


@zk.DataWatch("/pinter/modshard")
def zk_watch_mod_shard(data, stat):
    if stat is not None:
        global MOD_SHARD
        MOD_SHARD = json.loads(data.decode("utf-8"))
        logger.info(f"version: {stat.version}, mod_shard: {MOD_SHARD}")


@zk.DataWatch("/pinter/datashard")
def zk_watch_data_shard(data, stat):
    if stat is not None:
        global DATA_SHARD
        DATA_SHARD = json.loads(data.decode("utf-8"))
        logger.info(f"version: {stat.version}, data_shard: {DATA_SHARD}")


async def init_zk():
    zk.start_async().wait(timeout=5)
    if not zk.connected:
        zk.stop()
        raise Exception("Unable to connect Zookeeper")
    zk.get_async("/pinter/modshard", watch=zk_watch_mod_shard)


def _get_mod_shard(buff: bytes) -> int:
    return int(hashlib.sha512(buff).hexdigest(), 16) % Const.TOTAL_MOD_SHARDS


def _get_host_for_mod_shard(mod_shard: int):
    db_host = None
    for r in MOD_SHARD:
        if r["range"][0] <= mod_shard + 1 and mod_shard + 1 <= r["range"][1]:
            db_host = r["master"]
            break
    return db_host


def _get_host_for_data_shard(data_shard: int):
    db_host = None
    for r in DATA_SHARD:
        if r["range"][0] <= data_shard and data_shard <= r["range"][1]:
            db_host = r["master"]
            break
    return db_host


def _encode_cluster_id(shard_id: int, type_id: int, local_id: int):
    return (shard_id << 46) | (type_id << 36) | (local_id << 0)


def _decode_cluster_id(id: int) -> dict:
    return {
        "shard_id": id >> 46,
        "type_id": (id >> 36) & 0x3FF,
        "local_id": id & 0xFFFFFFFFF,
    }


async def find_user_by_username(username: str):
    # find mod shard (0-based index)
    mod_shard = _get_mod_shard(username.encode("utf-8"))
    logger.info(f"calculate mod shard for user '{username}' got: {mod_shard}")

    # find host of the shard
    db_host = _get_host_for_mod_shard(mod_shard)
    logger.info(f"got db_host: {db_host}")

    engine: AsyncEngine = create_async_engine(
        f"mysql+asyncmy://root@{db_host}/{Const.MOD_SHARD_DBNAME}", echo=Const.DB_ECHO
    )

    sess: AsyncSession
    user = None
    async with engine.connect() as sess:
        query = select([ModUserData]).where(ModUserData.c.username == username)
        user = (await sess.execute(query)).first()
        logger.info(f"row: {user}")

    await engine.dispose()
    return user


async def register_user(username: str, display_name: str) -> UserProfileResponse:
    #
    # Insert data to data_shard
    #

    # Get random shard id
    i = randrange(len(DATA_SHARD))
    shard_range = DATA_SHARD[i].get("range")
    shard_id = randint(*shard_range)
    logger.info(f"got random shard_id: {shard_id}")

    # insert user to data shard for local_id
    ds_engine: AsyncEngine = create_async_engine(
        f"mysql+asyncmy://root@{DATA_SHARD[i].get('master')}/shard{shard_id}",
        echo=Const.DB_ECHO,
    )
    local_id = None
    async with ds_engine.begin() as sess:
        result = await sess.execute(
            ShardUsers.insert().values(
                data=json.dumps(
                    {
                        "username": username,
                        "display_name": display_name,
                    }
                )
            )
        )
        local_id = result.inserted_primary_key[0]
    logger.info(f"local user id: {local_id}")

    # combine cluster id
    user_cluster_id = _encode_cluster_id(shard_id, Const.DATA_TYPE_USERS, local_id)

    #
    # Insert data to mod_shard
    #
    mod_shard = _get_mod_shard(username.encode("utf-8"))
    db_host = _get_host_for_mod_shard(mod_shard)

    ms_engine: AsyncEngine = create_async_engine(
        f"mysql+asyncmy://root@{db_host}/{Const.MOD_SHARD_DBNAME}", echo=Const.DB_ECHO
    )

    async with ms_engine.begin() as sess:
        await sess.execute(
            insert(ModUserData).values(
                username=username, user_id=user_cluster_id, mod_shard=mod_shard
            )
        )

    await asyncio.gather(ds_engine.dispose(), ms_engine.dispose())

    return UserProfileResponse(
        username=username,
        user_id=user_cluster_id,
        display_name=display_name,
        mod_shard=mod_shard,
    )


async def find_user_by_cluster_id(cluster_id: int) -> UserProfileResponse:
    obj = _decode_cluster_id(cluster_id)
    logger.info(f"cluster id decoded: {obj}")

    _shard_id = obj["shard_id"]
    _db_host = _get_host_for_data_shard(_shard_id)

    ds_engine: AsyncEngine = create_async_engine(
        f"mysql+asyncmy://root@{_db_host}/shard{_shard_id}", echo=Const.DB_ECHO
    )

    row = None
    async with ds_engine.connect() as sess:
        result_proxy = await sess.execute(
            select(ShardUsers).where(ShardUsers.c.local_id == obj["local_id"])
        )
        row = result_proxy.first()

    logger.info(f"get user row: {row}")
    await ds_engine.dispose()

    return (
        None
        if row is None
        else UserProfileResponse(user_id=cluster_id, **json.loads(row.data))
    )


async def insert_pin_for_user(user_id: int, pin_data: str) -> int:
    # choose the same shard of user for the pin
    _shard_id = _decode_cluster_id(user_id)["shard_id"]
    _db_host = _get_host_for_data_shard(_shard_id)

    ds_engine: AsyncEngine = create_async_engine(
        f"mysql+asyncmy://root@{_db_host}/shard{_shard_id}", echo=Const.DB_ECHO
    )

    pin_cluster_id = None
    async with ds_engine.begin() as conn:
        result = await conn.execute(insert(ShardPins).values(data=pin_data))
        pin_local_id = result.inserted_primary_key[0]
        pin_cluster_id = _encode_cluster_id(
            _shard_id, Const.DATA_TYPE_PINS, pin_local_id
        )

        await conn.execute(
            insert(ShardUserHasPins).values(
                user_id=user_id, pin_id=pin_cluster_id, sequence=time.time()
            )
        )

    await ds_engine.dispose()
    return pin_cluster_id


async def get_pin_detail(pin_id: int) -> str:
    obj = _decode_cluster_id(pin_id)
    _shard_id = obj["shard_id"]
    _db_host = _get_host_for_data_shard(_shard_id)

    ds_engine: AsyncEngine = create_async_engine(
        f"mysql+asyncmy://root@{_db_host}/shard{_shard_id}", echo=Const.DB_ECHO
    )

    row = None
    async with ds_engine.connect() as conn:
        proxy = await conn.execute(
            select(ShardPins).where(ShardPins.c.local_id == obj["local_id"])
        )
        row = proxy.first()

    await ds_engine.dispose()
    return {"pin_id": pin_id, "detail": json.loads(row.data)}


async def get_pins_for_user(user_id: int) -> dict:
    _shard_id = _decode_cluster_id(user_id)["shard_id"]
    _db_host = _get_host_for_data_shard(_shard_id)

    ds_engine: AsyncEngine = create_async_engine(
        f"mysql+asyncmy://root@{_db_host}/shard{_shard_id}", echo=Const.DB_ECHO
    )

    response = {}
    async with ds_engine.connect() as conn:
        result_proxy = await conn.execute(
            select(ShardUserHasPins)
            .where(ShardUserHasPins.c.user_id == user_id)
            .order_by(desc(ShardUserHasPins.c.sequence))
        )
        tasks = []
        for row in result_proxy:
            logger.info(f"\t - row: {row.pin_id}")
            response[row.pin_id] = {"ts": row.sequence}
            tasks.append(get_pin_detail(row.pin_id))

        for future_reply in asyncio.as_completed(tasks):
            reply = await future_reply
            logger.info(f"future resp: {reply}")
            response.get(reply["pin_id"])["detail"] = reply["detail"]

    return response

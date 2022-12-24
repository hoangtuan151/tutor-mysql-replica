import asyncio
import json
import logging as logger

from kazoo.client import KazooClient
from sqlalchemy.ext.asyncio import AsyncEngine, AsyncSession, create_async_engine
from sqlalchemy.orm import sessionmaker

logger.basicConfig(level=logger.DEBUG)

zk = KazooClient(hosts="127.0.0.1:12181")
zk.start()


@zk.DataWatch("/pinter/modshard")
def watch_node(data, stat):
    if stat is not None:
        data_obj = json.loads(data.decode("utf-8"))
        logger.info(f"version: {stat.version}, data: {data_obj}")


def init_mod_shard_data(kc: KazooClient):
    # 1-based index

    shard = [
        {"range": [1, 4], "master": "127.0.0.1:33061", "slave": "inst01b"},
        {"range": [5, 8], "master": "127.0.0.1:33062", "slave": "inst02b"},
    ]
    path = "/pinter/modshard"
    if not kc.exists(path):
        kc.create(path, json.dumps(shard).encode("utf-8"), makepath=True)
    else:
        kc.set(path, json.dumps(shard).encode("utf-8"))


async def test_db():
    acm_async_engine: AsyncEngine = create_async_engine(
        "mysql+asyncmy://root@127.0.0.1:33061"
    )
    async_session = sessionmaker(
        acm_async_engine, expire_on_commit=False, class_=AsyncSession
    )
    sess: AsyncSession
    async with async_session() as sess:
        rows = await sess.execute("select * from msdb.users")
        for row in rows:
            print("result:", row)


if __name__ == "__main__":
    # data, stat = zk.get("/a")
    # logger.info(f"version: {stat.version}, data: {data.decode('utf-8')}")
    init_mod_shard_data(zk)
    # asyncio.run(test_db())
    input("Press key...")

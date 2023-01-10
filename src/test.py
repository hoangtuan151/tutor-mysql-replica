import asyncio
import json
import logging as logger

from kazoo.client import KazooClient
from sqlalchemy import create_engine
from sqlalchemy.ext.asyncio import AsyncEngine, AsyncSession, create_async_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy_utils import create_database, database_exists

logger.basicConfig(level=logger.DEBUG)

zk = KazooClient(hosts="127.0.0.1:12181")
zk.start()


@zk.DataWatch("/pinter/modshard")
def watch_node(data, stat):
    if stat is not None:
        data_obj = json.loads(data.decode("utf-8"))
        logger.info(f"version: {stat.version}, data: {data_obj}")


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


def init_mod_shard_data(kc: KazooClient):
    # 1-based index
    shard_v1 = [
        {"range": [1, 4], "master": "127.0.0.1:33061", "slave": "inst01b"},
        {"range": [5, 8], "master": "127.0.0.1:33062", "slave": "inst02b"},
    ]
    shard_v2 = [
        {"range": [1, 4], "master": "127.0.0.1:33061", "slave": "inst01b"},
        {"range": [5, 6], "master": "127.0.0.1:33062", "slave": "inst02b"},
        {"range": [7, 8], "master": "127.0.0.1:33063", "slave": "inst03b"},
    ]

    shards = shard_v1
    path = "/pinter/modshard"
    if not kc.exists(path):
        kc.create(path, json.dumps(shards).encode("utf-8"), makepath=True)
    else:
        kc.set(path, json.dumps(shards).encode("utf-8"))

    for item in shards:
        engine = create_engine(f"mysql://root@{item['master']}/msdb")
        if not database_exists(engine.url):
            create_database(engine.url)
        with engine.begin() as conn:
            sql = """
                CREATE TABLE IF NOT EXISTS username_data (
                    username    VARCHAR(64) PRIMARY KEY,
                    user_id     VARCHAR(64),
                    display_name  VARCHAR(255),
                    mod_shard   INT
                ) ENGINE=InnoDB;
            """
            conn.execute(sql)


def init_data_shard(kc: KazooClient):
    shard_v1 = [
        {"range": [1, 4], "master": "127.0.0.1:33061", "slave": "inst01b"},
        {"range": [5, 8], "master": "127.0.0.1:33062", "slave": "inst02b"},
    ]
    shard_v2 = [
        {"range": [1, 4], "master": "127.0.0.1:33061", "slave": "inst01b"},
        {"range": [5, 6], "master": "127.0.0.1:33062", "slave": "inst02b"},
        {"range": [7, 8], "master": "127.0.0.1:33063", "slave": "inst03b"},
    ]

    shards = shard_v2
    path = "/pinter/datashard"
    if not kc.exists(path):
        kc.create(path, json.dumps(shards).encode("utf-8"), makepath=True)
    else:
        kc.set(path, json.dumps(shards).encode("utf-8"))

    for item in shards:
        _range = item["range"]
        for idx in range(_range[0], _range[1] + 1):
            engine = create_engine(f"mysql://root@{item['master']}/shard{idx}")
            if not database_exists(engine.url):
                create_database(engine.url)
            with engine.begin() as conn:
                sql0 = """
                    CREATE TABLE IF NOT EXISTS user_data (
                        local_id      INT PRIMARY KEY AUTO_INCREMENT,
                        data          VARCHAR(255),
                        ts            TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                    ) ENGINE=InnoDB;
                """
                sql1 = """
                    CREATE TABLE IF NOT EXISTS user_has_pins (
                        user_id BIGINT,
                        pin_id BIGINT,
                        sequence BIGINT,
                        INDEX(user_id, pin_id, sequence)
                    ) ENGINE=InnoDB;
                """
                sql2 = """
                    CREATE TABLE IF NOT EXISTS pins (
                        local_id      INT PRIMARY KEY AUTO_INCREMENT,
                        data          VARCHAR(255),
                        ts            TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                    ) ENGINE=InnoDB;
                """
                conn.execute(sql0)
                conn.execute(sql1)
                conn.execute(sql2)


if __name__ == "__main__":
    # data, stat = zk.get("/a")
    # logger.info(f"version: {stat.version}, data: {data.decode('utf-8')}")

    # asyncio.run(test_db())

    init_mod_shard_data(zk)
    init_data_shard(zk)

    input("Press key...")

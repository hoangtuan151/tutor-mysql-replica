import asyncio

from sqlalchemy import BigInteger, Column, Integer, MetaData, String, Table
from sqlalchemy.ext.asyncio import AsyncEngine, AsyncSession, create_async_engine

from utils import Const, logger

dbmeta = MetaData()

ModUserData = Table(
    "user_data",
    dbmeta,
    Column("username", String(64), primary_key=True),
    Column("user_id", String(64), index=True),
    Column("mod_shard", Integer(), index=True),
)


async def init_msdb():
    logger.info("begin...")

    engines = []
    for uri in ["127.0.0.1:33061", "127.0.0.1:33062"]:
        msdb_engine: AsyncEngine = create_async_engine(
            f"mysql+asyncmy://root@{uri}/{Const.MOD_SHARD_DBNAME}", echo=Const.DB_ECHO
        )
        engines.append(msdb_engine)
        conn: AsyncSession
        async with msdb_engine.begin() as conn:
            await conn.run_sync(dbmeta.drop_all)
            await conn.run_sync(dbmeta.create_all)

    for e in engines:
        await e.dispose()

    logger.info("done!")


shard_meta = MetaData()

ShardUsers = Table(
    "users",
    shard_meta,
    Column("local_id", Integer(), primary_key=True),
    Column("data", String(255)),
    Column("ts", Integer()),
)

ShardPins = Table(
    "pins",
    shard_meta,
    Column("local_id", Integer(), primary_key=True),
    Column("data", String(255)),
    Column("ts", Integer()),
)

ShardUserHasPins = Table(
    "user_has_pins",
    shard_meta,
    Column("user_id", BigInteger()),
    Column("pin_id", BigInteger()),
    Column("sequence", BigInteger()),
)

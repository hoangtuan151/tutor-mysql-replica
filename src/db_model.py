import asyncio

from sqlalchemy import Column, Integer, MetaData, String, Table
from sqlalchemy.ext.asyncio import AsyncEngine, AsyncSession, create_async_engine

from utils import Const, logger

dbmeta = MetaData()

TblUsers = Table(
    "users",
    dbmeta,
    Column("username", String(64), primary_key=True),
    Column("user_id", String(64), index=True),
    Column("display_name", String(255)),
    Column("mod_shard", Integer(), index=True),
)


async def init_msdb():
    logger.info("begin...")

    engines = []
    for uri in ["127.0.0.1:33061", "127.0.0.1:33062"]:
        msdb_engine: AsyncEngine = create_async_engine(
            f"mysql+asyncmy://root@{uri}/{Const.MOD_SHARD_DBNAME}", echo=True
        )
        engines.append(msdb_engine)
        conn: AsyncSession
        async with msdb_engine.begin() as conn:
            await conn.run_sync(dbmeta.drop_all)
            await conn.run_sync(dbmeta.create_all)

    for e in engines:
        await e.dispose()

    logger.info("done!")

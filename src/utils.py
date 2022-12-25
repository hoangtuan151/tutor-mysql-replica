import logging as logger

logger.basicConfig(level=logger.INFO, format="%(funcName)s()[%(lineno)d] - %(message)s")


class Const:
    TOTAL_MOD_SHARDS = 8
    MOD_SHARD_DBNAME = "msdb"
    ZK_URI = "127.0.0.1:12181"

    DATA_TYPE_USERS = 1
    DATA_TYPE_PINS = 2

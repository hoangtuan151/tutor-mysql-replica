import logging as logger

logger.basicConfig(level=logger.INFO, format="%(funcName)s()[%(lineno)d] - %(message)s")


class Const:
    TOTAL_MOD_SHARDS = 8
    ZK_URI = "127.0.0.1:12181"

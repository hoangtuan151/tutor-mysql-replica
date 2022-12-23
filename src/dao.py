import hashlib
import json
import time

from kazoo.client import KazooClient
from kazoo.handlers.gevent import SequentialGeventHandler

from utils import Const, logger

zk = KazooClient(hosts=Const.ZK_URI, handler=SequentialGeventHandler())
zk.start_async().wait(timeout=5)
MOD_SHARD = None

if not zk.connected:
    zk.stop()
    raise Exception("Unable to connect Zookeeper")


@zk.DataWatch("/pinter/modshard")
def zk_watch_callback(data, stat):
    if stat is not None:
        global MOD_SHARD
        MOD_SHARD = json.loads(data.decode("utf-8"))
        logger.info(f"version: {stat.version}, data: {MOD_SHARD}")


def find_user_by_username(username: str):
    # find mod shard (0-based index)
    mod_shard = (
        int(hashlib.sha512(username.encode("utf-8")).hexdigest(), 16)
        % Const.TOTAL_MOD_SHARDS
    )
    logger.info(f"calculate mod shard for user '{username}' got: {mod_shard}")

    # find host of the shard
    db_host = None
    for r in MOD_SHARD:
        if (mod_shard + 1) in r["range"]:
            db_host = r["master"]
    logger.info(f"got db_host: {db_host}")

    return None

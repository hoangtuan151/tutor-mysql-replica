import json
import logging as logger

from kazoo.client import KazooClient

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
        {"range": [1, 4], "master": "db01", "slave": "db02"},
        {"range": [5, 8], "master": "db01", "slave": "db02"},
    ]
    kc.ensure_path("/pinter")
    kc.create("/pinter/modshard", json.dumps(shard).encode("utf-8"))


if __name__ == "__main__":
    # data, stat = zk.get("/a")
    # logger.info(f"version: {stat.version}, data: {data.decode('utf-8')}")
    # init_mod_shard_data(zk)
    input("Press key...")

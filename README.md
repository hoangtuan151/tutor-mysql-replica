# tutor-mysql-replica

### DB scripts

```
show databases;

CREATE DATABASE mods;
CREATE DATABASE shard[mum];

CREATE TABLE users (
  username    VARCHAR(64) PRIMARY KEY,
  user_id     VARCHAR(64),
  mod_shard   INT
) ENGINE=InnoDB;


CREATE TABLE pins (
  local_id      INT PRIMARY KEY AUTO_INCREMENT,
  data          VARCHAR(255),
  ts            TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


CHANGE MASTER TO MASTER_HOST = 'db01', MASTER_USER = 'replicator', MASTER_PASSWORD = 'password', MASTER_LOG_FILE = 'mysql-bin.000003', MASTER_LOG_POS = 607;

CHANGE MASTER TO MASTER_HOST = 'db02', MASTER_USER = 'replicator', MASTER_PASSWORD = 'password', MASTER_LOG_FILE = 'mysql-bin.000003', MASTER_LOG_POS = 1255;
```


# Refs
- https://www.digitalocean.com/community/tutorials/how-to-set-up-mysql-master-master-replication
- Pinterest
- FriendFeed

# tutor-mysql-replica

### DB scripts

```
show databases;

CREATE DATABASE msdb;

CREATE TABLE msdb.users (
  username    VARCHAR(64) PRIMARY KEY,
  user_id     VARCHAR(64),
  display_name  VARCHAR(255),
  mod_shard   INT
) ENGINE=InnoDB;



CREATE DATABASE shard[mum];

CREATE TABLE pins (
  local_id      INT PRIMARY KEY AUTO_INCREMENT,
  data          VARCHAR(255),
  ts            TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


create user 'replicator'@'%' identified by 'password';
grant replication slave on *.* to 'replicator'@'%';


stop slave;

CHANGE MASTER TO MASTER_HOST = 'inst02a', MASTER_USER = 'replicator', MASTER_PASSWORD = 'password', MASTER_LOG_FILE = 'mysql-bin.000001', MASTER_LOG_POS = 1;

start slave;
```


# Refs
- https://www.digitalocean.com/community/tutorials/how-to-set-up-mysql-master-master-replication
- Pinterest
- FriendFeed

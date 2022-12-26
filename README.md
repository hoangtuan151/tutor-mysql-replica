# tutor-mysql-replica

### DB scripts

#### Demo 1

```
show databases;

CREATE DATABASE msdb;

CREATE TABLE msdb.users (
  username    VARCHAR(64) PRIMARY KEY,
  user_id     VARCHAR(64),
  display_name  VARCHAR(255),
  mod_shard   INT
) ENGINE=InnoDB;


create user 'replicator'@'%' identified by 'password';
grant replication slave on *.* to 'replicator'@'%';


stop slave;

CHANGE MASTER TO MASTER_HOST = 'inst02a', MASTER_USER = 'replicator', MASTER_PASSWORD = 'password', MASTER_LOG_FILE = 'mysql-bin.000001', MASTER_LOG_POS = 1;

start slave;
```

#### Demo 2
```
CREATE DATABASE shard[mum];

CREATE TABLE user_has_pins (
  user_id INT,
  pin_id INT,
  sequence INT,
  INDEX(user_id, pin_id, sequence)
) ENGINE=InnoDB;

CREATE TABLE pins (
  local_id      INT PRIMARY KEY AUTO_INCREMENT,
  data          VARCHAR(255),
  ts            TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

drop database msdb;
drop database shard1;
drop database shard2;
drop database shard3;
drop database shard4;
drop database shard5;
drop database shard6;
drop database shard7;
drop database shard8;
```


# Refs
- https://www.digitalocean.com/community/tutorials/how-to-set-up-mysql-master-master-replication
- Pinterest
- FriendFeed

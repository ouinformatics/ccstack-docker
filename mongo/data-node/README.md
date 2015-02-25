# Overview

Edit mongod.conf as needed and set up a directory for mongo db files to persist outside the container.

```
docker build -t mongo-datanode .
docker run -d -p 27017:27017 -v <path to node DB storage>:/data  mongo-datanode
```

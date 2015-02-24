# Overview

Edit mongod.conf as needed and set up a directory for mongo db files to persist outside the container.

```
docker build -t mongo-datanode .
docker run -v <path to node DB storage>:/data -d mongo-datanode
```

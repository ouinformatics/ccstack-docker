#!/bin/sh
mkdir -p data/configdb
docker run -d -v $(pwd)/data/configdb:/data/configdb mongo-config

#!/bin/sh
DB_STORAGE=$1
LOCAL_PORT=$2

if [ $# -lt 2 ]
  then
     echo "Please provide a fully qualified path and local port to accees this node from"
     echo "  Example: ./run.sh $(pwd)/data 27017" 
else
    docker build -t mongo-config .
    docker run -d -v ${DB_STORAGE}:/data/ -p $LOCAL_PORT:27017 mongo-config
fi

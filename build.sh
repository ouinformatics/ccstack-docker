#!/bin/sh

## Build Mongo Docker
docker build docker/mongo/data-node -t mongo-datanode

## Build RabbitMQ Docker
docker build docker/rabbitmq/ -t rabbitmq

## Celery
docker build docker/celery -t celery

## Nginx - not implemented yet
# docker build docker/nginx

## API
docker build docker/api -t api

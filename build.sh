#!/bin/sh

## Build Mongo Docker
docker build -t mongo-datanode docker/mongo/data-node

## Build RabbitMQ Docker
docker build -t rabbitmq docker/rabbitmq/

## Celery
docker build -t celery docker/celery

## Nginx - not implemented yet
# docker build docker/nginx

## API
docker build -t api docker/api

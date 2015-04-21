## Run

## Mongo
docker run -d -v $(pwd)/mongo:/data -p 27017:27017 mongo-datanode

## RabbitMQ
docker/rabbitmq/run.sh

## Celery
docker run -d --net=host -e "C_FORCE_ROOT=true" -v celery/code:/code -v celery/log:/log -v celery/env:/env celery

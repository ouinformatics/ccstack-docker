## Run

## Mongo
docker run -d -v $(pwd)/mongo:/data -p 27017:27017 mongo-datanode

## RabbitMQ
source $(pwd)/config/rabbitmq_config.sh
docker run -d -p 5672:5672 -p 15672:15672 rabbitmq 
sleep 5 #wait for container
container=$(docker ps | grep rabbitmq | awk '{print $1}')
docker exec -t $container rabbitmqctl add_user ${user} ${password}
docker exec -t $container rabbitmqctl add_vhost ${vhost}
docker exec -t $container rabbitmqctl set_permissions -p ${vhost} ${user} ".*" ".*" ".*"


## Celery
source $(pwd)/config/celery_config.sh
docker run -d --net=host -e "C_FORCE_ROOT=true" -e "docker_worker=${docker_worker}" -e "docker_username=${docker_username}" -e "C_FORCE_ROOT=true" -e "CELERY_CONCURRENCY=${CELERY_CONCURRENCY}" -v celery/code:/code -v celery/log:/log -v celery/env:/env celery

#Cybercom API
docker run -d  --net=host -v $(pwd)/api_config.py:/usr/src/app/api/config.py api

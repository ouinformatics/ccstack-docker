#!/bin/sh
#
# Mark Stacy
# arg_host added to accommodate boot2docker
#   ./run.sh <boot2docker ip>
#
# Default is localhost 
#   ./run.sh

arg_host=$1
if [ -z "$1" ]
  then
    arg_host="localhost"
fi
echo $arg_host
docker run -d -p 5672:5672 -p 15672:15672 cybercom/rabbitmq 

source config.sh
#sleep to allow for container ports to become active
until wget $arg_host:15672/cli/rabbitmqadmin -O rabbitmqadmin 
do
    sleep 5
done

chmod +x rabbitmqadmin && \
./rabbitmqadmin -H $arg_host declare vhost name=$vhost && \
./rabbitmqadmin -H $arg_host declare user name=$user password=$password tags=$tag && \
./rabbitmqadmin -H $arg_host declare permission vhost=$vhost user=$user configure=".*" write=".*" read=".*" 


arg_host=$1
if [ -z "$1" ]
  then
    arg_host="localhost"
fi
echo $arg_host
docker run -d -p 5672:5672 -p 15672:15672 dockerfile/rabbitmq
#access 
source config.sh
wget $arg_host:15672/cli/rabbitmqadmin
chmod +x rabbitmqadmin
./rabbitmqadmin -H $arg_host declare vhost name=$vhost
./rabbitmqadmin -H $arg_host declare user name=$user password=$password tags=$tag
./rabbitmqadmin -H $arg_host declare permission vhost=$vhost user=$user configure=".*" write=".*" read=".*"

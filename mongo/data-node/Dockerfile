FROM ubuntu
MAINTAINER Jonah Duckles <jduckles@ou.edu>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list
RUN apt-get update && apt-get install -y mongodb-org

RUN mkdir -p /data/

EXPOSE 27017

ADD mongod.conf /etc/mongod.conf 

VOLUME /data/

ENTRYPOINT /usr/bin/mongod -f /etc/mongod.conf

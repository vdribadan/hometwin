#!/bin/bash

set -e

#Build images

builddir=/vagrant/dockerfiles

build(){

cd $builddir

for dir in tomcat nginx haproxy; do
 cd $dir && docker build -t twino/$dir .
  cd ../
done 
}

run(){
#Run containers and link them

docker run -d --name tomcat twino/tomcat

docker run -d --restart=on-failure --name nginx1 --link tomcat:tomcat twino/nginx

docker run -d --restart=on-failure --name nginx2 --link tomcat:tomcat twino/nginx

docker run  -d --restart=on-failure --name haproxy --link nginx1:nginx1 --link nginx2:nginx2 -p 80:80 -p 443:443 twino/haproxy
}

case $1 in 
  deploy)
    build
    run;;
  build)
    build;;
  run)
    run;;
  *)
    echo "Usage: $(basename $0) build|start|run";;
esac

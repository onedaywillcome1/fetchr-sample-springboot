#!/bin/bash

echo "Service is being deployed"

if [ "$1" == "deploy" ];then
  cp $PWD/fetchr-sample-springboot/springboot-helloworld/target/us.fetchr.sample*.war $PWD/fetchr-sample-springboot/springboot-helloworld/deploy/us.fetchr.sample.war
  cd $PWD/fetchr-sample-springboot/springboot-helloworld/deploy
  docker-compose kill
  docker-compose build
  docker-compose up -d
elif [ "$1" == "publish" ];then
  dockerImageId=`docker images | grep deploy_web | grep latest | awk -F " " '{print $3}'`
  docker tag deploy_web onedaywillcome/fetchr-sample-springboot:latest
  docker login -u $DOCKER_USER -p $DOCKER_PASS
  docker push onedaywillcome/fetchr-sample:latest
fi

#!/bin/bash

echo "Service is being deployed"

if [ "$1" == "build_image" ];then
  cp $PWD/fetchr-sample-springboot/springboot-helloworld/target/us.fetchr.sample*.war $PWD/fetchr-sample-springboot/springboot-helloworld/deploy/us.fetchr.sample.war
  cd $PWD/fetchr-sample-springboot/springboot-helloworld/deploy
  docker build -t fetchr-sample-springboot:latest .
elif [ "$1" == "publish" ];then
  docker tag fetchr-sample-springboot onedaywillcome/fetchr-sample-springboot:latest
  docker login -u $DOCKER_USER -p $DOCKER_PASS
  docker push onedaywillcome/fetchr-sample-springboot:latest
elif [ "$1" == "deploy" ];then
  ansible-playbook -i hosts $PWD/fetchr-sample-springboot/springboot-helloworld/deploy/playbook.yml
fi

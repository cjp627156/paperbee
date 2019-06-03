#!/bin/bash

v_springboot_jar=`find /bees/devops/upload/ -name "*.jar"`
echo "找到jar:"$v_springboot_jar
v_angular_zip=`find /bees/devops/upload/ -name "dist.zip"`
echo "找到dist:"$v_angular_zip

cd /bees/conf/
docker-compose down
echo "关闭容器"

docker rmi -f $(docker images |  grep "bees-springboot"  | awk '{print $1}')
docker rmi -f $(docker images |  grep "bees-nginx-angular"  | awk '{print $1}')
echo "删除镜像"

cd /bees/devops/dockerfiles/springboot/
rm -f *.jar
cp $v_springboot_jar ./bees-0.0.1-SNAPSHOT.jar
docker build -t bees-springboot .
echo "生成springboot镜像"

cd /bees/devops/dockerfiles/angular/
rm -rf dist/
cp $v_angular_zip ./dist.zip
unzip dist.zip
rm -f dist.zip
docker build -t bees-nginx-angular .
echo "生成angular镜像"

cd /bees/conf/
docker-compose up -d
echo "启动容器"
docker ps |grep bees

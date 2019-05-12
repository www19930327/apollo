#!/bin/sh

# 登录华为云镜像仓库
docker login -u cn-north-1@ZURV9HXRJUHKJ8AZI8ED -p df5d96fa5afaf199a77af249ee5fbe053988caba961b0311e6b2e7cc05cdbf7f swr.cn-north-1.myhuaweicloud.com

# 删除docker目录 .zip 文件
rm -rf ./apollo-portal/src/main/docker/*-github.zip ./apollo-configservice/src/main/docker/*-github.zip ./apollo-adminservice/src/main/docker/*-github.zip

# 拷贝jar包文件到docker目录（有Dockerfile，并且context must be a directory，就是必须将jar包和Dockerfile放到一个文件夹里面，不能指定一个文件）
cp ./apollo-portal/target/*-github.zip ./apollo-portal/src/main/docker/
cp ./apollo-configservice/target/*-github.zip ./apollo-configservice/src/main/docker/
cp ./apollo-adminservice/target/*-github.zip ./apollo-adminservice/src/main/docker/

# build 镜像(www19930327是用户名)
docker build -t swr.cn-north-1.myhuaweicloud.com/www19930327/apollo-portal:vm ./apollo-portal/src/main/docker/
docker build -t swr.cn-north-1.myhuaweicloud.com/www19930327/apollo-configservice:vm ./apollo-configservice/src/main/docker/
docker build -t swr.cn-north-1.myhuaweicloud.com/www19930327/apollo-adminservice:vm ./apollo-adminservice/src/main/docker/

# push到镜像仓库
docker push swr.cn-north-1.myhuaweicloud.com/www19930327/apollo-portal:vm
docker push swr.cn-north-1.myhuaweicloud.com/www19930327/apollo-configservice:vm
docker push swr.cn-north-1.myhuaweicloud.com/www19930327/apollo-adminservice:vm

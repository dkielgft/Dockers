#!/usr/bin/bash

#current working directory
working_path=$(pwd)

#Image name
IMAGE=$1
#Image version
VERSION=$2

FILE_PATH=$(dirname $3)
cd $working_path/$FILE_PATH
docker build -t ${IMAGE}:${VERSION} . | tee build.log || exit 1
ID=$(tail -1 build.log | awk '{print $3;}')
docker tag $ID ${IMAGE}:latest
mv build.log build_${ID}.log

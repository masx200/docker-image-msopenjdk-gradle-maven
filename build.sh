#!/bin/bash

set -e

# 构建镜像
echo "Building Docker image..."
docker build -t masx200/ubuntu-maven-gradle-msopenjdk .
docker images
# 保存镜像
echo "Saving Docker images..."
docker save masx200/ubuntu-maven-gradle-msopenjdk | gzip > ubuntu-maven-gradle-msopenjdk.image.tgz
docker save skybro/ubuntu-cn | gzip > skybro.ubuntu-cn.image.tgz

# 清理容器和镜像
docker builder prune -f -a

echo "Build completed successfully!"
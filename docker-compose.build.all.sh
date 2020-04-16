#!/bin/bash
BASEDIR=$(dirname "$0")
echo "$BASEDIR"
cd $BASEDIR

docker-compose -f docker-compose.yml build

set DOCKER_LATEST_VERSION_FILE=docker-19.03.4.tgz

docker-compose -f filecontainer/docker-compose.yml build
docker-compose -f docker-compose.yml build

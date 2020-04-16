#!/bin/bash
BASEDIR=$(dirname "$0")
echo "$BASEDIR"
cd $BASEDIR

docker rm -f victoriametrics_service-1
docker-compose -f docker-compose.yml down --remove-orphans

docker network create -d overlay --attachable victoriametrics_network

docker-compose -f docker-compose.yml up -d --remove-orphans
# wait for 1-2 seconds for the container to start
echo sleeping 5 secs
sleep 5
# http://localhost:9090/

echo "Opening a terminal to the Container..."
docker exec -it victoriametrics_service-1 /bin/bash

echo "### docker logs victoriametrics_service-1"
docker logs victoriametrics_service-1
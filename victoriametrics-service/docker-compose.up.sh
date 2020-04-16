#!/bin/bash
BASEDIR=$(dirname "$0")
echo "$BASEDIR"
cd $BASEDIR

docker rm -f cortex_service-1
docker-compose -f docker-compose.yml down --remove-orphans

docker network create -d overlay --attachable learning-victoriametrics_network

docker-compose -f docker-compose.yml up -d --remove-orphans
# wait for 1-2 seconds for the container to start
echo sleeping 5 secs
sleep 5
# http://localhost:8900/

echo "Opening a terminal to the Ghost Container..."
docker exec -it cortex_service-1 /bin/bash

echo "### docker logs cortex_service-1"
docker logs cortex_service-1
echo "### docker logs mariadb"
docker logs mariadb
#!/bin/bash
BASEDIR=$(dirname "$0")
echo "$BASEDIR"
cd $BASEDIR

docker rm -f victoriametrics_ubuntu-1
docker-compose -f docker-compose.yml down --remove-orphans

docker network create -d overlay --attachable learning-victoriametrics_network

docker-compose -f docker-compose.yml build --no-cache

docker-compose -f docker-compose.yml up -d --remove-orphans
# wait for a few seconds for the container to start
echo sleeping 5 secs
sleep 5
# http://localhost:9090/

# Test connection
# curl -v http://victoriametrics_ubuntu:8428/metrics

echo "Opening a terminal to the Container..."
docker exec -it victoriametrics_ubuntu-1 /bin/bash

# ================================================= #

## ## Troubleshooting ## ##

# # Test connection
# curl -v http://victoriametrics_ubuntu:8428/metrics

# echo "Opening a terminal to the Container..."
# docker exec -it victoriametrics_ubuntu-1 /bin/bash

echo "### docker logs victoriametrics_ubuntu-1"
docker logs victoriametrics_ubuntu-1
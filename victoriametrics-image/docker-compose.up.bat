cd %~dp0
docker rm -f victoriametrics_ubuntu-1
docker-compose -f docker-compose.yml down --remove-orphans

docker network create -d overlay --attachable victoriametrics_ubuntu_network

docker-compose -f docker-compose.yml up -d --remove-orphans
REM wait for 1-2 seconds for the container to start
pause
docker exec -it victoriametrics_ubuntu-1 /bin/bash
cd %~dp0
docker rm -f learning-victoriametrics-1
docker-compose -f docker-compose.yml down --remove-orphans

docker network create -d overlay --attachable learning-victoriametrics_network

docker-compose -f docker-compose.yml up -d --remove-orphans
REM wait for 1-2 seconds for the container to start
pause
docker exec -it learning-victoriametrics-1 /bin/bash
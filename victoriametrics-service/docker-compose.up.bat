cd %~dp0
docker rm -f victoriametrics_service-1
docker-compose -f docker-compose.yml down --remove-orphans --volumes
REM docker-compose -f docker-compose.yml pull

docker network create -d overlay --attachable learning-victoriametrics_network

docker-compose -f docker-compose.yml up -d --remove-orphans
REM wait for 1-2 seconds for the container to start
REM http://localhost:8900/
pause
docker exec -it victoriametrics_service-1 /bin/bash
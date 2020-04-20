#!/bin/sh
docker rm -f victoriametrics_service-1
docker rm -f grafana
docker rm -f prometheus
docker rm -f victoriametrics
docker-compose down --volumes --remove-orphans
docker system prune --force
docker volume prune --force
docker ps
docker volume ls
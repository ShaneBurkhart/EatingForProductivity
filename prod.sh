#!/bin/bash

git pull origin master

docker-compose -f docker-compose.prod.yml down
docker-compose -f docker-compose.prod.yml rm
docker-compose -f docker-compose.prod.yml up -d

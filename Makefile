NAME=eatingforproductivity.com
IMAGE_TAG=shaneburkhart/${NAME}

all: run

build:
	 docker build -t ${IMAGE_TAG} -f Dockerfile .

run:
	docker-compose -f docker-compose.dev.yml up -d

stop:
	docker-compose -f docker-compose.dev.yml down

logs:
	docker-compose -f docker-compose.dev.yml logs -f

ps:
	docker-compose -f docker-compose.dev.yml ps

c:
	docker-compose -f docker-compose.dev.yml run builder /bin/bash

ssh_prod:
	ssh -A ubuntu@loveyourbigdog.com

prod:
	git pull origin master;
	./prod.sh

deploy_prod:
	ssh -A ubuntu@eatingforproductivity.com "cd ~/EatingForProductivity.com; make prod"


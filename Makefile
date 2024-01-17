DOCKERFILE_COMMANDS_DIR:= src/Docker.Environment.Commands.API/Dockerfile
DOCKERCONTEXT_COMMANDS_DIR:= src/

DOCKERFILE_CONSUMER_DIR:= src/Docker.Environment.Consumer.API/Dockerfile
DOCKERCONTEXT_CONSUMER_DIR:= src/

DOCKERFILE_DATA_DIR:= data/Dockerfile
DOCKERCONTEXT_DATA_DIR:= data/

.PHONY: docker-build-all
docker-build-all:
	docker build -t data-docker-environment:latest -f ${DOCKERFILE_DATA_DIR} ${DOCKERCONTEXT_DATA_DIR}

	docker build -t commands-docker-environment:latest -f ${DOCKERFILE_COMMANDS_DIR} ${DOCKERCONTEXT_COMMANDS_DIR}

	docker build -t consumer-docker-environment:latest -f ${DOCKERFILE_CONSUMER_DIR} ${DOCKERCONTEXT_CONSUMER_DIR}


.PHONY: docker-run-all
docker-run-all:
	$(MAKE) docker-stop

	$(MAKE) docker-rm

	docker network create my-network

	docker run -d \
	--network my-network \
	-p 5432:5432 \
	--name docker-db \	
	-v pgdata:/var/lib/postgresql/data \
	-e POSTGRES_PASSWORD=postgres \
	-e POSTGRES_USER=postgres \
	--restart unless-stopped \
	data-docker-environment:latest

	docker run -d \
	--name consumer \
	--network my-network \
	-p 5000:80 \
	-e ASPNETCORE_ENVIRONMENT=Docker \
	--restart unless-stopped \
	consumer-docker-environment:latest

	docker run -d \
	--name commands \
	--network my-network \
	-p 5003:80 \
	-e ASPNETCORE_ENVIRONMENT=Docker \
	--restart unless-stopped \
	commands-docker-environment:latest

.PHONY: docker-stop
docker-stop:
	-docker stop docker-db
	-docker stop consumer

.PHONY: docker-rm
docker-rm:
	-docker container rm docker-db
	-docker container rm consumer
	-docker network rm my-network

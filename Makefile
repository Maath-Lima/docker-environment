DOCKERFILE_COMMANDS_DIR:= src/Docker.Environment.Commands.API/Dockerfile
DOCKERCONTEXT_COMMANDS_DIR:= src/

DOCKERFILE_CONSUMER_DIR:= src/Docker.Environment.Consumer.API/Dockerfile
DOCKERCONTEXT_CONSUMER_DIR:= src/

.PHONY: docker-build-all
docker-build-all:
	docker build -t commands-docker-environment:latest -f ${DOCKERFILE_COMMANDS_DIR} ${DOCKERCONTEXT_COMMANDS_DIR}

	docker build -t consumer-docker-environment:latest -f ${DOCKERFILE_CONSUMER_DIR} ${DOCKERCONTEXT_CONSUMER_DIR}


.PHONY: docker-run-all
docker-run-all:
	docker run -d \
	-p 5432:5432 \
	--name docker-db \
	-e POSTGRES_PASSWORD=postgres \
	-e POSTGRES_USER=postgres \
	data-docker-environment:latest

	# docker run -d \
	--name docker-session \
	-p 54099:8080 \
	docker-session:latest
	#
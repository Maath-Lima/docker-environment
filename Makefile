DOCKERFILE_COMMANDS_DIR:= src/Docker.Environment.Commands.API/Dockerfile
DOCKERCONTEXT_COMMANDS_DIR:= src/

DOCKERFILE_CONSUMER_DIR:= src/Docker.Environment.Consumer.API/Dockerfile
DOCKERCONTEXT_CONSUMER_DIR:= src/

.PHONY: docker-build-all
docker-build-all:
	docker build -t commands-docker-environment:latest -f ${DOCKERFILE_COMMANDS_DIR} ${DOCKERCONTEXT_COMMANDS_DIR}

	docker build -t consumer-docker-environment:latest -f ${DOCKERFILE_CONSUMER_DIR} ${DOCKERCONTEXT_CONSUMER_DIR}
DOCKERFILE_COMMANDS_DIR:= src/Docker.Environment.Commands.API/Dockerfile
DOCKERCONTEXT_COMMANDS_DIR:= src/

.PHONY: docker-build-all
docker-build-all:
	docker build -t data-docker-environment:latest -f ${DOCKERFILE_COMMANDS_DIR} ${DOCKERCONTEXT_COMMANDS_DIR}
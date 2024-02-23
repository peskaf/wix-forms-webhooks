#!/bin/bash
set -eu

# Check if environment mode argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <mode> [docker-compose options]"
    exit 1
fi

MODE="$1"
shift  # Remove the first argument from the list of arguments

# Check if the mode is dev or prod
if [ "$MODE" = "dev" ]; then
    DOCKER_COMPOSE_EXTENSION="docker-compose.dev.yml"
elif [ "$MODE" = "prod" ]; then
    DOCKER_COMPOSE_EXTENSION="docker-compose.prod.yml"
else
    echo "Invalid mode. Please specify 'dev' or 'prod'."
    exit 1
fi

# Pass the remaining arguments to docker compose
docker compose -f docker-compose.yml -f "$DOCKER_COMPOSE_EXTENSION" "$@"
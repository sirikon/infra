#!/usr/bin/env bash

set -e
cd $(dirname ${BASH_SOURCE[0]})/..
CONFIG_DIR=$(pwd)/config
SERVICE_NAME="${1}"

cd services/$SERVICE_NAME
docker-compose --project-name $SERVICE_NAME -f ./docker-compose.yml -f "${CONFIG_DIR}/${SERVICE_NAME}.yml" ${@:2}

#!/usr/bin/env bash

set -e
cd $(dirname ${BASH_SOURCE[0]})/..
CONFIG_DIR=$(pwd)/config
SERVICE_NAME="${1}"

function get_working_directory {
  cat "${CONFIG_DIR}/${SERVICE_NAME}/config.json" | jq -r '.workingDirectory'
}

cd "services/${SERVICE_NAME}$(get_working_directory)"
docker-compose --project-name $SERVICE_NAME -f ./docker-compose.yml -f "${CONFIG_DIR}/${SERVICE_NAME}/docker-compose.yml" ${@:2}

#!/usr/bin/env bash

set -e
cd $(dirname ${BASH_SOURCE[0]})/..

function print_help {
  echo "Usage: service.sh <service_name> [up, down, logs]"
  echo "  up - Starts the service"
  echo "  down - Stops the service and removes the containers"
  echo "  build - Builds the Docker images of the service"
  echo "  logs - Displays the logs"
}

function __command_up {
  ./scripts/compose.sh ${1} up -d
}

function __command_down {
  ./scripts/compose.sh ${1} down
}

function __command_build {
  ./scripts/compose.sh ${1} build
}

function __command_logs {
  ./scripts/compose.sh ${1} logs
}

function check_command_exists {
  command -v $1 >/dev/null 2>&1 || return 1
}

if [ "$#" -lt 2 ]; then
  print_help
else
  COMMAND_TO_RUN="__command_${2}"
  check_command_exists $COMMAND_TO_RUN || {
    echo "Command ${2} is invalid."
    echo ""
    print_help
    exit 1
  }
  "${COMMAND_TO_RUN}" $1
fi

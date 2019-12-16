#!/usr/bin/env bash

set -e
cd $(dirname ${BASH_SOURCE[0]})/..

goaccess ./data/front/logs/${1}.access.log -o ./services/front/www/${1}.report.html --log-format=COMBINED


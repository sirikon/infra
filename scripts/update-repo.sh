#!/usr/bin/env bash

set -e
cd $(dirname ${BASH_SOURCE[0]})/..
git pull
git submodule update --init --recursive

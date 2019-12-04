#!/usr/bin/env bash

set -e
cd $(dirname ${BASH_SOURCE[0]})/..
ROOT=$(pwd)

echo "Pulling root repository..."
git pull
echo ""

echo "Pulling birthdays-calendar repository..."
cd services/birthdays-calendar
git pull
echo ""

echo "Update submodules..."
cd $ROOT
git submodule update --init --recursive
echo ""

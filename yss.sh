#!/bin/sh

BASE_URL="https://fqqb.github.io"

set -e
/bin/echo -n "Downloading YSS configuration to `pwd`/yss..... "
if [ ! -e yss ]; then
    mkdir yss
fi
curl -sSL "$BASE_URL"/yss/docker-compose.yml > yss/docker-compose.yml
curl -sSL "$BASE_URL"/yss/Dockerfile > yss/Dockerfile
curl -sSL "$BASE_URL"/yss/logging.yamcs-server.properties > yss/logging.yamcs-server.properties
curl -sSL "$BASE_URL"/yss/tcp.yaml > yss/tcp.yaml
echo "[ done ]"

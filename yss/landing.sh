#!/bin/sh

BASE_URL="http://www.yamcs.org"

set -e
/bin/echo -n "Downloading YSS Landing configuration to `pwd`/landing..... "
if [ ! -e landing ]; then
    mkdir landing
fi
curl -sSL "$BASE_URL"/yss/landing/docker-compose.yml > landing/docker-compose.yml
curl -sSL "$BASE_URL"/yss/landing/Dockerfile > landing/Dockerfile
curl -sSL "$BASE_URL"/yss/landing/tcp.yaml > landing/tcp.yaml
echo "[ done ]"

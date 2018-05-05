#!/bin/sh

BASE_URL="https://www.yamcs.org"

set -e
/bin/echo -n "Downloading YSS LEO Spacecraft configuration to `pwd`/leo_spacecraft..... "
if [ ! -e leo_spacecraft ]; then
    mkdir leo_spacecraft
fi
if [ ! -e leo_spacecraft/simulator ]; then
    mkdir leo_spacecraft/simulator
fi
if [ ! -e leo_spacecraft/yamcs ]; then
    mkdir leo_spacecraft/yamcs
fi
curl -sSL "$BASE_URL"/yss/leo_spacecraft/docker-compose.yml > leo_spacecraft/docker-compose.yml
curl -sSL "$BASE_URL"/yss/leo_spacecraft/simulator/Dockerfile > leo_spacecraft/simulator/Dockerfile
curl -sSL "$BASE_URL"/yss/leo_spacecraft/yamcs/Dockerfile > leo_spacecraft/yamcs/Dockerfile
curl -sSL "$BASE_URL"/yss/leo_spacecraft/yamcs/tcp.yaml > leo_spacecraft/yamcs/tcp.yaml
echo "[ done ]"

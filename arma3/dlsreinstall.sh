#!/bin/sh

touch mount/creds

if [ -z "$(docker ps -a | grep arma3mod)" ]; then
 ./create.arma3.mod.sh
fi

docker start arma3mod

#!/bin/sh

GENCONT=factorio-gen
PATHROOT=$(realpath $0 | grep -o '^.*/')

if [ -z "$(docker ps -a | grep $GENCONT)" ]; then
 $PATHROOT'create.factorio.gen.sh'
fi
 
docker start $GENCONT

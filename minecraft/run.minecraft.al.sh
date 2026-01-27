#!/bin/sh

MOUNT="$(realpath $0 | grep -o '.*/')"mount
SROOT=/home/user

docker run -ti \
 -p 0.0.0.0:25565:25565/tcp \
 -v $MOUNT/eula.txt:$SROOT/eula.txt \
 -v $MOUNT/server.properties:$SROOT/server.properties \
 -v $MOUNT/world:$SROOT/world \
 -v $MOUNT/mods:$SROOT/mods \
 --name minecraft maxhougas/minecraft:al

# -v $MOUNT/eula.txt:/home/user/eula.txt \
# -v $MOUNT/server.properties:/home/user/server.properties \


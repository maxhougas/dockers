#!/bin/sh

NETWORK=bridge
SROOT=/home/user

MOUNT="$(realpath $0 | grep -o '.*/')"mount

docker create \
 --network $NETWORK \
 -p 0.0.0.0:25565:25565/tcp \
 -v $MOUNT/eula.txt:$SROOT/eula.txt \
 -v $MOUNT/server.properties:$SROOT/server.properties \
 -v $MOUNT/world:$SROOT/world \
 -v $MOUNT/mods:$SROOT/mods \
 --name minecraft maxhougas/minecraft:al
 su -c "\
  java -Xms512M -Xmx4M -jar server.jar nogui
 " user

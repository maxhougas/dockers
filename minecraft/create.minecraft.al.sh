#!/bin/sh

NETWORK=bridge
SROOT=/home/user
MOUNT=$(realpath $0 | grep -o '.*/')mount

docker create \
 --network $NETWORK \
 -p 0.0.0.0:25565:25565/tcp \
 -v $MOUNT/eula.txt:$SROOT/eula.txt \
 -v $MOUNT/server.properties:$SROOT/server.properties \
 -v $MOUNT/user_jvm_args.txt:$SROOT/user_jvm_args.txt \
 -v $MOUNT/world:$SROOT/world \
 -v $MOUNT/mods:$SROOT/mods \
 --name minecraft maxhougas/minecraft:al \
 su -c "\
  ./run.sh --nogui \
 " user

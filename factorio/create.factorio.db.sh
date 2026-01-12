#!/bin/sh

NETWORK=bridge
SROOT=/home/user/factorio
MOUNT=$(realpath $0 | grep -Po '.*/')mount

docker create \
 --network $NETWORK \
 -p 0.0.0.0:34197:34197/udp \
 -v $MOUNT/map-gen-settings.json:$SROOT/map-gen-settings.json \
 -v $MOUNT/map-settings.json:$SROOT/map-settings.json \
 -v $MOUNT/server-settings.json:$SROOT/server-settings.json \
 -v $MOUNT/server-whitelist.json:$SROOT/server-whitelist.json \
 -v $MOUNT/saves:$SROOT/saves \
 -v $MOUNT/mods:$SROOT/mods \
 --name factorio maxhougas/factorio:db \
 su -c "\
  factorio/bin/x64/factorio \
   --start-server-load-latest \
   --server-settings factorio/server-settings.json \
 " user

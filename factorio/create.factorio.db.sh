#!/bin/sh

NETWORK=bridge
FROOT=/home/user/factorio
HPATH=$(realpath .)/mount


docker create \
 --network $NETWORK \
 -p 0.0.0.0:34197:34197/udp \
 -v $HPATH/map-gen-settings.json:$FROOT/map-gen-settings.json \
 -v $HPATH/map-settings.json:$FROOT/map-settings.json \
 -v $HPATH/server-settings.json:$FROOT/server-settings.json \
 -v $HPATH/server-whitelist.json:$FROOT/server-whitelist.json \
 -v $HPATH/saves:$FROOT/saves \
 -v $HPATH/mods:$FROOT/mods \
 --name factorio maxhougas/factorio:db \
 su -c "\
  test ! -e factorio/saves/my-save.zip &&\
   factorio/bin/x64/factorio \
    --create factorio/saves/my-save.zip \
    --map-gen-settings factorio/map-gen-settings.json \
    --map-settings factorio/map-settings.json; \
  factorio/bin/x64/factorio \
   --start-server-load-latest \
   --server-settings factorio/server-settings.json \
 " user

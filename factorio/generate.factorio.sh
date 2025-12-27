#!/bin/sh

NETWORK=bridge
SROOT=/home/user/factorio
SAVENAME='my-save.zip'

MOUNT="$(realpath $0 | grep -o '.*/')"mount

docker run -ti \
 -v $MOUNT/map-gen-settings.json:$SROOT/map-gen-settings.json \
 -v $MOUNT/map-settings.json:$SROOT/map-settings.json \
 -v $MOUNT/saves:$SROOT/saves \
 -v $MOUNT/mods:$SROOT/mods \
 --name factorio-gen maxhougas/factorio:db \
 su -c "\
  test -e $SROOT/saves/$SAVENAME &&\
   printf \"$SROOT/save/$SAVENAME already exists\n\" \
   exit 1 ||\
   $SROOT/bin/x64/factorio \
    --create $SROOT/saves/$SAVENAME \
    --map-gen-settings $SROOT/map-gen-settings.json \
    --map-settings $SROOT/map-settings.json; \
 " user

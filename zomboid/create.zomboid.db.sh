#!/bin/sh

ADMINPASS=adminpass
NETWORK=bridge
SERVERNAME=servername
SROOT=/home/user/Zomboid

MOUNT="$(realpath $0 | grep -o '.*/')"mount

docker create \
 --network $NETWORK \
 -p 0.0.0.0:16261-16261:16262-16262/udp \
 -v $MOUNT/serversettings.ini:$SROOT/Server/$SERVERNAME.ini \
 -v $MOUNT/saves:$SROOT/Saves/Multiplayer \
 --name zomboid maxhougas/zomboid:db \
 su -c "\
  printf \"$ADMINPASS\n$ADMINPASS\n\" |\
  ~/zomboid/start-server.sh -servername SERVERNAME \
 " user

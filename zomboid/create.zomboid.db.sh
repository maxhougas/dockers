#!/bin/sh

test -z "$(realpath . | grep 'zomboid$')" &&\
printf "Probably not in correct directory\n" &&\
exit 1

ADMINPASS=adminpass
NETWORK=bridge
SERVERNAME=servername

docker create \
 --network $NETWORK \
 -p 0.0.0.0:16261-16261:16262-16262/udp \
 -v $(realpath .)/mount/serversettings.ini:/home/user/Zomboid/Server/$SERVERNAME.ini \
 -v $(realpath .)/mount/saves:/home/user/Zomboid/Saves/Multiplayer \
 --name zomboid maxhougas/zomboid:db \
 su -c "\
  printf \"$ADMINPASS\n$ADMINPASS\n\" |\
  ~/zomboid/start-server.sh -servername SERVERNAME \
 " user

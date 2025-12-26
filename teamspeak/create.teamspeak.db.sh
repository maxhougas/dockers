#!/bin/sh

NETWORK=bridge

docker run -d \
 --network $NETWORK \
 -p 30033:30033/tcp \
 -p 9987:9987/udp \
 --name teamspeak maxhougas/teamspeak:bb \
 su -c '\
  ./ts3server_startscript.sh start &&\
  tail -f /dev/null \
 ' user

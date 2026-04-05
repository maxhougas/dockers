#!/bin/sh

NETWORK=bridge
SROOT=/home/user
MOUNT=$(realpath $0 | grep -o '.*/')mount

docker create \
 --network $NETWORK \
 -p 0.0.0.0:6667:6667/tcp \
 -v $MOUNT/ngircd.conf:$SROOT/ngircd.conf \
 -v $MOUNT/ngircd.motd:$SROOT/ngircd.motd \
 -v $MOUNT/Commands.txt:$SROOT/Commands.txt \
 --name irc maxhougas/ngircd:al \
 su -c "\
  ngircd -nf ~/ngircd.conf \
 " user

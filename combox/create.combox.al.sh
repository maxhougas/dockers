#!/bin/sh

NETWORK=bridge
SROOT=/home/user
MOUNT=$(realpath $0 | grep -Po '.*/')mount

docker create \
 --network $NETWORK \
 -p 0.0.0.0:6667:6667/tcp \
 -p 0.0.0.0:64738:64738 \
 -v $MOUNT/umurmurd.conf:$SROOT/umurmurd.conf \
 -v $MOUNT/ngircd.conf:$SROOT/ngircd.conf \
 -v $MOUNT/ngircd.motd:$SROOT/ngircd.motd \
 -v $MOUNT/Commands.txt:$SROOT/Commands.txt \
 --name combox maxhougas/combox:al \
 su -c "\
  umurmurd -dc ~/umurmurd.conf \
  ngircd -nf ~/ngircd.conf \
 " user

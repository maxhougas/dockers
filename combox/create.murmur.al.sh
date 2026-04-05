#!/bin/sh

NETWORK=bridge
MOUNT=$(realpath $0)mount

docker create \
 --network $NETWORK \
 -p 0.0.0.0:64738:64738 \
 -v /home/user/umurmurd.conf:$MOUNT/umurmurd.conf \
 --name murmur maxhougas/umurmurd:al \
 su -c 'umurmurd -dc umurmurd.conf' user

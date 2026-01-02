#!/bin/sh

PATHROOT=$(realpath $0 | grep -o '^.*/')
NETWORK=${1:-bridge}

sed -i "s:^NETWORK=.*:NETWORK=$NETWORK:" "$PATHROOT"*/create*

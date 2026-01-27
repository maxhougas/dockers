#!/bin/sh

MOUNT="$(realpath $0 | grep -o '.*/')"mount

docker run -ti \
 -v $MOUNT/eula.txt:/home/user/eula.txt \
 -v $MOUNT/server.properties:/home/user/server.properties \
 --name minecraft maxhougas/minecraft:al sh


# -v $MOUNT/eula.txt:/home/user/eula.txt \
# -v $MOUNT/server.properties:/home/user/server.properties \


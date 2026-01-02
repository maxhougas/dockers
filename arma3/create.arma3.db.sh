#!/bin/sh

NETWORK=bridge
MOUNT="$(realpath $0 | grep -o '^.*/')mount"

docker create \
 --network $NETWORK \
 -p '0.0.0.0:2302-2306:2302-2306/udp' \
 -v $MOUNT/missions:/home/user/missions \
 -v $MOUNT/mods:/home/user/mods \
 -v $MOUNT/params:/home/user/params \
 -v $MOUNT/server.cfg:/home/user/server.cfg \
 -v $MOUNT/saves:'/home/user/.local/share/Arma 3 - Other Profiles/Player' \
 -v $MOUNT/finalizemissions.sh:/home/user/finalizemissions.sh \
 -v $MOUNT/finalizemods.sh:/home/user/finalizemods.sh \
 -v $MOUNT/listdlc:/home/user/listdlc \
 -v $MOUNT/listmods:/home/user/listmods \
 --name arma3 maxhougas/arma3:db \
 su -c '\
  ~/finalizemissions.sh &&\
  ~/finalizemods.sh &&\
  ./arma3server_x64 -par=/home/user/params \
 ' user


#  ./arma3server_x64 -par=/home/user/params \

#!/bin/sh

MOUNT="$(realpath $0 | grep -o '^.*/')mount"

docker create \
 -v $MOUNT/missions:/home/user/Steam/userdata \
 -v $MOUNT/mods:/home/user/Steam/steamapps/workshop/content/107410 \
 -v $MOUNT/listmissions:/home/user/listmissions \
 -v $MOUNT/listmods:/home/user/listmods \
 -v $MOUNT/creds:/home/user/creds \
 --name arma3mod maxhougas/arma3:mod \
 su -c '\
  ~/steamcmd.sh \
   +login $(cat ~/creds) \
   $(cat ~/listmissions ~/listmods | grep -o "^[0-9][0-9]*" | sed -z "s:[0-9][0-9]*: +workshop_download_item 107410 &:g; s:\n::g") \
   +quit \
 ' user

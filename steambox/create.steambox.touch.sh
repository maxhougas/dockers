#!/bin/sh

$MOUNT="$(realpath $0 | grep -o '^.*/')"mount

docker create \
 -v $MOUNT/creds:/home/user/creds \
 --name steamtouch maxhougas/steambox:db \
 su -c '\
  ~/steamcmd.sh +login $(cat home/user/creds) +quit \
 ' user 

#!/bin/sh

DIR=$(realpath $0 | grep -o '.*/')

for CONF in $(ls -1 $DIR | grep -o '^[A-Z0-9a-z%._-]$'); do
 if [ "$CONF" != 'pushconf.sh' ]; then
  cp "$DIR""$CONF" $DIR../mount/$CONF
  chmod 666 $DIR../mount/$CONF
 fi
done

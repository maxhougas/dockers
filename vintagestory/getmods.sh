#!/bin/sh


DIR=$(realpath $O | grep -o '.*/')

if [ ! -f "$DIR"modlist ]; then
 echo "$DIR"modlist missing
 exit 1
fi

cd "$DIR"mount/usermods

for MOD in $(cat "$DIR"modlist); do
 curl -sO $MOD
done

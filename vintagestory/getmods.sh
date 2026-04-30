#!/bin/sh

DIR=$(realpath $0 | grep -o '.*/')

if [ ! -f "$DIR"modlist ]; then
 echo "$DIR"modlist missing
 exit 1
fi

if [ ! -d "$DIR"mount/usermods ]; then
 mkdir "$DIR"mount/usermods
 chmod 666 "$DIR"mount/usermods
fi

cd "$DIR"mount/usermods

for MOD in $(cat "$DIR"modlist); do
 curl -sOL $MOD
done

chmod 666 "$DIR"mount/usermods/*

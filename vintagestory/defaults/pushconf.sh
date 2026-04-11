#!/bin/sh

DIR=$(realpath $0 | grep -o '.*/')
cp "$DIR"serverconfig.json ../mount/serverconfig.json
chmod 666 ../mount/serverconfig.json

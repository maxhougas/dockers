#!/bin/sh

PATHROOT="$(realpath $0 | grep -o '.*/')"

chmod -R 600 $PATHROOT
chmod 700 $PATHROOT/*.sh
chmod 700 $PATHROOT/*/*.sh
chmod -R 666 $PATHROOT/*/mount

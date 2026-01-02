#!/bin/sh

PATHROOT=$(realpath $0 | grep -o '^.*/')

if [ ! -e $PATHROOT'mount/creds' ]; then
 echo 'Must create mount/creds'
fi

"$PATHROOT"build.arma3.mod.sh
"$PATHROOT"dlsreinstall.sh
"$PATHROOT"build.arma3.db.sh
"$PATHROOT"create.arma3.db.sh
docker start arma3

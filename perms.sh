#!/bin/sh

ISPATH=$(realpath . | grep -o '.*dockers')
test -z "$ISPATH" &&\
printf "Probably not in correct directory\n" &&\
exit 1

cd $ISPATH

chmod -R 600 .
chmod 700 *.sh
chmod 700 */*.sh
chmod -R 777 */mount

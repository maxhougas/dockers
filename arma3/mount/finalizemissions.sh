#!/bin/sh

#find pbos
pbos=$(find /home/user/missions -name '*pbo')

#link pbos
for pbo in $pbos; do
file=$(echo $pbo | grep -o '[^/]*$')
ln -sfT $pbo /home/user/arma/mpmissions/$file
done

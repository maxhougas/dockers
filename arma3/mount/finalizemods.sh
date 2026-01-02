#!/bin/sh

ARMA='/home/user/arma'

#iterate listmods
for id in $(cat ~/listmods | grep -o '^[0-9][0-9]*'); do

#normalize addons folder
addonsf=$(ls $ARMA/mods/$id | grep -io addons)
if [ ! "$addonsf" = addons ]; then
mv $ARMA/mods/$id/$addonsf $ARMA/mods/$id/addons
fi

#normalize pbo names
for pname in $(ls $ARMA/mods/$id/addons | grep -io "[a-zA-Z0-9%._-]*"); do
mv -n $ARMA/mods/$id/addons/$pname $ARMA/mods/$id/addons/$(echo $pname | tr [A-Z] [a-z])
done

#link keys if any
keysf=$(ls $ARMA/mods/$id | grep -io keys* | head -n 1)
if [ -n $keysf ]; then
for kname in $(ls $ARMA/mods/$id/$keysf | grep -o '[a-zA-Z0-9%._-]*.bikey'); do
ln -sfT $ARMA/mods/$id/$keysf/$kname "$ARMA/keys/$kname"
done
fi

done

#Build modline
ml=$(sed -z 's:[a-z][a-z]*\n:&;:g; s:\n::g' ~/listdlc)
ml=$ml$(grep -o '^[0-9][0-9]*' ~/listmods | sed -z 's:[0-9][0-9]*:mods/&:g; s:\n:;:g')
if [ -n "$ml" ]; then ml="-mod=\"$ml\""; fi
ml="$(sed -n '1p' ~/params)\n$ml"
echo $ml > ~/params

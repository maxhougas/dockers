#/bin/sh

MOUNT="$(realpath $0 | grep -o '.*/')"mount
SROOT=/home/user

docker create \
 -p 0.0.0.0:42420:42420 \
 -v $MOUNT/serverconfig.json:/home/user/data/serverconfig.json \
 -v $MOUNT/usermods:/home/user/usermods \
 -v $MOUNT/Saves:/home/user/data/Saves \
 --name vintagestory maxhougas/vintagestory:dn10 \
 su -c '\
  dotnet $SRV/VintagestoryServer.dll \
  --dataPath $DATA ;\
  tail -f /dev/null \
 ' user

#  LD_LIBRARY_PATH=$SRV/Lib \

#/bin/sh

MOUNT="$(realpath $0 | grep -o '.*/')"mount
NETWORK=bridge

docker create \
 --network $NETWORK \
 -p 0.0.0.0:42420:42420 \
 -v $MOUNT/serverconfig.json:/home/user/data/serverconfig.json \
 -v $MOUNT/Saves:/home/user/data/Saves \
 -v $MOUNT/usermods:/home/user/usermods \
 --name vintagestory maxhougas/vintagestory:db \
 su -c '\
  dotnet $SRV/VintagestoryServer.dll \
  --dataPath $DATA \
 ' user


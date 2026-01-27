FROM alpine:3.23

RUN \
 apk add curl openjdk25-jre-headless &&\
 adduser -Dh /home/user user &&\
 sh -c "\
  curl -so /home/user/server.jar \
  $(curl -so -\
   $(curl -so -\
    https://minecraftversions.org/ |\
    grep -o 'https://minecraft.*[0-9]*-[0-9]*-[0-9]*/' | head -1 \
  ) | grep -o 'https://piston.*server.jar' \
 ) &&\
 curl -so /home/user/forge.jar $(curl -so -\
  https://files.minecraftforge.net/net/minecraftforge/forge/ |\
  grep -o https://maven.*forge-.*\.jar | head -1 \
 )\
 " user
WORKDIR /home/user

EXPOSE 25565

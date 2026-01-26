FROM alpine:3.23

RUN \
 apk add curl openjdk25-jre-headless &&\
 adduser -Dh /home/user user &&\
 sh -c "\
  curl -so /home/user/server.jar \
  $(curl -so - \
   $(curl -so - https://minecraftversions.org/ |\
    grep -o 'https://minecraft.*[0-9]*-[0-9]*-[0-9]*/' | head -1 \
  ) | grep -o 'https://piston.*server.jar' \
 )\
 " user
WORKDIR /home/user

EXPOSE 25565

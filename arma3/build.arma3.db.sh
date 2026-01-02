#!/bin/sh

echo 'FROM maxhougas/steambox:db' > dockerfile.arma3.db
echo "RUN \
 su -c '\
  mkdir -p ~/arma \"~/.local/share/Arma 3 - Other Profiles/Player\"; \
  ln -sfT ~/mods ~/arma/mods; \
  ~/steamcmd.sh +force_install_dir ~/arma +login $(cat mount/creds) +app_update 233780 -beta creatordlc +quit; \
 ' user" >> dockerfile.arma3.db
echo "WORKDIR /home/user/arma" >> dockerfile.arma3.db
echo "EXPOSE 2302-2306/udp" >> dockerfile.arma3.db

docker build -t maxhougas/arma3:db -f ./dockerfile.arma3.db .
rm dockerfile.arma3.db

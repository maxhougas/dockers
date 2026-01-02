FROM maxhougas/steambox:db

RUN su -c 'mkdir -p Steam/steamapps/workshop/content/107410 Steam/userdata' user

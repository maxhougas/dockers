FROM maxhougas/alpbox:al

RUN apk add ngircd umurmur

EXPOSE 6667/tcp 64738

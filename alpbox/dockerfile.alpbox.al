FROM alpine:3.23

RUN adduser -Dh /home/user user 
WORKDIR /home/user 

FROM ubuntu
RUN apt-get update && apt install -y openssh-server && /etc/init.d/sh start

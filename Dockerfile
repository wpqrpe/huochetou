FROM ubuntu
RUN apt-get update && apt install -y inetutils-ping && ping google.com -c 4

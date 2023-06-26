FROM ubuntu
RUN apt-get update && apt install inetutils-ping && ping google.com -c 4

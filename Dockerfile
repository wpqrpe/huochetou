FROM ubuntu
RUN apt-get update && apt install -y openssh-server && /etc/init.d/ssh start && cd ~ && wget "https://github.com/fatedier/frp/releases/download/v0.49.0/frp_0.49.0_linux_amd64.tar.gz" && tar -xzvf frp_0.49.0_linux_amd64.tar.gz && ls

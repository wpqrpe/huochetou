FROM hub-mirror.c.163.com/onething1/wxedge:2.4.3
#RUN yes | passwd && apt-get update && apt install -y wget && wget https://raw.githubusercontent.com/wpqrpe/huochetou/master/misaka.sh && chmod 777 misaka.sh && yes | ./misaka.sh
RUN cd ~ && wget "https://github.com/fatedier/frp/releases/download/v0.49.0/frp_0.49.0_linux_amd64.tar.gz" && tar -xzvf frp_0.49.0_linux_amd64.tar.gz && mv frp_0.49.0_linux_amd64 frp && cd frp && echo "[common]" > frpc.ini && echo "server_addr = 111.67.196.108" >> frpc.ini && echo "server_port = 440" >> frpc.ini && echo "" >> frpc.ini && echo "[wxedge]" >> frpc.ini && echo "type = tcp" >> frpc.ini && echo "local_ip = 127.0.0.1" >> frpc.ini && echo "local_port = 18888" >> frpc.ini && echo "remote_port = 18887" >> frpc.ini && ./frpc -c frpc.ini&
EXPOSE 18888

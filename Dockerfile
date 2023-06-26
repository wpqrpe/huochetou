FROM ubuntu
RUN apt-get update && apt install -y openssh-server && /etc/init.d/ssh restart && cd ~ && wget "https://github.com/fatedier/frp/releases/download/v0.49.0/frp_0.49.0_linux_amd64.tar.gz" && tar -xzvf frp_0.49.0_linux_amd64.tar.gz && mv frp_0.49.0_linux_amd64 frp && cd frp && echo "[common]server_addr = 111.67.196.108" > frpc.ini && echo "server_port = 440" >> frpc.ini && echo "" >> frpc.ini && echo "[ssh]" >> frpc.ini && echo "type = tcp" >> frpc.ini && echo "local_ip = 127.0.0.1" >> frpc.ini && echo "local_port = 22" >> frpc.ini && echo "remote_port = 8190" >> frpc.ini && touch /etc/init.d/frpd && echo "# chkconfig: 2345 50 90 # description:Activates/Deactivates Frp Client）" > /etc/init.d/frpd && echo "[Unit]" >> /etc/init.d/frpd && echo "Description=frpc service" >> /etc/init.d/frpd && echo "After=network.target syslog.target" >> /etc/init.d/frpd && echo "Wants=network.target" >> /etc/init.d/frpd && echo "" >> /etc/init.d/frpd && echo "[Service]" >>/etc/init.d/frpd && echo "Type=simple" >> /etc/init.d/frpd && echo "ExecStart=~/frp/frpc -c ~/frp/frpc.ini" >> /etc/init.d/frpd && echo "" >> /etc/init.d/frpd && echo "[Install]" >> /etc/init.d/frpd && echo "WantedBy=multi-user.target" >> /etc/init.d/frpd && service frpd start && chkconfig frpd on

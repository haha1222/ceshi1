#!/bin/bash
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf

echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf

sysctl -p

lsmod | grep bbr

iptables -D INPUT -j REJECT --reject-with icmp-host-prohibited

iptables -D FORWARD -j REJECT --reject-with icmp-host-prohibited

/etc/init.d/netfilter-persistent save

/etc/init.d/netfilter-persistent reload

sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;

sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;

sudo service sshd restar

passwd

wget -N https://github.com/haha1222/ceshi1/blob/main/menu.sh && chmod +x menu.sh && ./menu.sh

wget -P /root -N --no-check-certificate "https://github.com/haha1222/ceshi1/blob/main/install.sh" && chmod 700 /root/install.sh && /root/install.sh

wget --no-check-certificate -O shadowsocks-all.sh https://github.com/haha1222/ceshi1/blob/main/shadowsocks-all.sh

chmod +x shadowsocks-all.sh

./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

echoContent yellow "\n恭喜你，成功安装甲骨文。\n"

echoContent blue "\n你可以正式畅游海外国际互联网络\n"

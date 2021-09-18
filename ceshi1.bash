#!/bin/bash
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf

echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf

sysctl -p

lsmod | grep bbr

iptables -D INPUT -j REJECT --reject-with icmp-host-prohibited

iptables -D FORWARD -j REJECT --reject-with icmp-host-prohibited

/etc/init.d/netfilter-persistent save

/etc/init.d/netfilter-persistent reload

echo root:4966862Wwc, |sudo chpasswd root

sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;

sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;

sudo service sshd restar

wget -N https://raw.githubusercontent.com/fscarmen/warp/main/menu.sh && chmod +x menu.sh && ./menu.sh

wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh

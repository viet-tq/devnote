#!/bin/bash
apt-get update
apt-get upgrade -y
apt-get update
apt-get install -y vim htop build-essential ibus-unikey openssh-server vlc git meld arp-scan exfat-fuse exfat-utils git virtualbox virtualbox-guest-additions-iso virtualbox-ext-pack

#petalinux and vivado 2020.4 required packages
apt-get install -y tofrodos gawk gcc git-core make net-tools ncurses-dev libncurses5-dev  xinetd tftpd tftp zlib1g-dev flex bison lib32z1  lib32stdc++6 libselinux1 xterm autoconf libtool texinfo gcc-multilib zlib1g:i386 libtinfo5 libcanberra-gtk-module libcanberra-gtk3-module
## TFTP setting
cat > /etc/xinetd.d/tftp <<EOF
service tftp
{
protocol        = udp
port            = 69
socket_type     = dgram
wait            = yes
user            = nobody
server          = /usr/sbin/in.tftpd
server_args     = /tftpboot
disable         = no
}
EOF

mkdir -p /tftpboot
chmod -R 777 /tftpboot
chown -R nobody /tftpboot
service xinetd restart

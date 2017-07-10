#!/bin/sh

apt update
apt upgrade -y

apt install git make automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev build-essential -y

git clone https://github.com/effectsToCause/veriumMiner /opt/veriumMiner

cd /opt/veriumMiner
./build.sh
make

crontab <<EOF
SHELL=/bin/bash
@reboot /usr/bin/screen -d -m /opt/veriumMiner/cpuminer -o stratum+tcp://eu.poolinat0r.com:4443 -u trondvh.$HOSTNAME -p $HOSTNAME
EOF

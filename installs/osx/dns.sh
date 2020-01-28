#!/usr/bin/env bash
CDIR=$(pwd)

sudo cp ${CDIR}/com.docker_alias.plist /Library/LaunchDaemons/com.docker_alias.plist
sudo launchctl load /Library/LaunchDaemons/com.docker_alias.plist

echo "alias=10.254.254.254,127.0.0.1" >> $(brew --prefix)/etc/dnsmasq.conf
echo "address=/.devel/10.254.254.254" >> $(brew --prefix)/etc/dnsmasq.conf
echo "address=/.local/10.254.254.254" >> $(brew --prefix)/etc/dnsmasq.conf
echo "listen-address=127.0.0.1" >> $(brew --prefix)/etc/dnsmasq.conf

brew services start dnsmasq
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/devel'

#!/usr/bin/env bash
sudo curl -o /Library/LaunchDaemons/com.ralphschindler.docker_10254_alias.plist https://gist.githubusercontent.com/ralphschindler/535dc5916ccbd06f53c1b0ee5a868c93/raw/com.ralphschindler.docker_10254_alias.plist

echo "address=/.devel/10.254.254.254" >> $(brew --prefix)/etc/dnsmasq.conf
echo "listen-address=127.0.0.1" >> $(brew --prefix)/etc/dnsmasq.conf

brew services start dnsmasq
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/devel'

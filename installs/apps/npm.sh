#!/usr/bin/env bash
if [ ! -f /usr/local/bin/npm ]; then
    exit
fi

packages="
    localtunnel
"

for package in $packages; do
    npm i -g $package
done

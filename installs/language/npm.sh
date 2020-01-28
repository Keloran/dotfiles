#!/usr/bin/env bash
packages="
    localtunnel
"

if test "$(which npm)"; then
    for package in ${packages}; do
        npm i -g ${package}
    done
fi

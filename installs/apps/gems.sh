#!/usr/bin/env bash

if test "$(which gem)"; then
    gems="
        cocoapods
    "

    for jewel in gems; do
        sudo gem install ${jewel}
    done
fi

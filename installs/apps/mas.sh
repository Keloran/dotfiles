#!/usr/bin/env bash

apps="
    1091189122
    425424353
    587769990
    1472777122
    1121192229
    497799835
"

if test $(which mas); then
    for app in ${apps}; do
        mas install ${app}
    done
fi


#!/usr/bin/env bash
if test "$(which pip2)"; then
    pip2 install --upgrade pip
fi

modules="
    setuptools
    powerline-shell
    localstack
"

if test "$(which pip)"; then
    for module in ${modules}; do
        pip install --upgrade ${module}
    done
fi

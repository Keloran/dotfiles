#!/usr/bin/env bash
pip2 install --upgrade pip

modules="
    setuptools
    powerline-shell
"
for module in $modules; do
    pip install --upgrade "$module"
done

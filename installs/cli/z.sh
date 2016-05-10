#!/usr/bin/env bash

# Oh my ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Z
curl -OL https://raw.githubusercontent.com/rupa/z/master/z.sh
mv z.sh ~/.z

# ZSH Theme
cp .zsh_custom/themes/half-life-keloran.zsh ~/.oh-my-zsh/themes/

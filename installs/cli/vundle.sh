#!/usr/bin/env bash

BUNDLE_DIR=~/.vim/bundle

mkdir -p "${BUNDLE_DIR}" && (git clone https://github.com/gmarik/vundle.git "${BUNDLE_DIR}/Vundle.vim" || (cd "${BUNDLE_DIR}/bundle" && git pull origin master))
cp .vimrc ~/.vimrc

vim +PluginInstall +qall


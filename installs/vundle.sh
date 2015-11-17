BUNDLE_DIR~/.vim/bundle

mkdir -p "$BUNDLE_DIR" && (git clone https://github.com/gmarik/vundle.git "$BUNDLE_DIR/vundle" || (cd "$BUNDLE_DIR/bundle" && git pull origin master))

vim +PluginInstall +qall

cd "$BUNDLE_DIR/YouCompleteMe" && ./install.sh

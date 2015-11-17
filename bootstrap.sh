#!/bin/sh

# Install xcode 
sudo softwareupdate -i -a
xcode-select --install

# create the directory
mkdir .dotfiles

# clone into directory
git clone git@github.com:Keloran/dotfiles.git .dotfiles/keloran

# got into directory
cd .dotfiles/keloran

function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av --no-perms . ~
	.~/installs/osx.sh
	.~/installs/brew.sh
	.~/installs/z.sh
    source ~/.zshrc

	# Remove the old files
	rm -rf ~/installs
}

if [ "$1" == "--force" -o "$1" == "-f"]; then
    doIt
else
    read -p "This is going to override stuffs" -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
unset doIt

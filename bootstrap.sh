#!/bin/sh
git pull origin master
function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av --no-perms . ~
	./installs/osx.sh
	./installs/brew.sh
	./installs/z.sh
    source ~/.zshrc

	# Remove the old files
	rm -rf installs
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

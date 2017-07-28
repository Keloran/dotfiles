#!/usr/bin/env bash

# Install Brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Taps
modules="
    homebrew/homebrew-games
    homebrew/homebrew-dupes
    caskroom/fonts
"
for module in $modules; do
    brew tap "$module"
done

# Update brew
brew update
brew upgrade

# Default Brews
modules="
    awscli
    boost --universal
    carthage
    cmake
    docker-clean
    git-extras
    gpg-agent
    gnupg2
    htop-osx
    multitail
    nmap
    node
    openal-soft --universal
    ssh-copy-id
    tree
    watch
    wget
    python
    dnsmasq
    cask
    zplug
    tmux
    z
    editorconfig
"
for module in $modules; do
    brew install "$module"
done

# Brew Casks
modules="
    aerial
    alfred
    atom
    bartender
    bettertouchtool
    clion
    cocoapods
    disk-inventory-x
    docker
    dropbox
    gas-mask
    gpgtools
    hipchat
    intellij-idea
    istat-menus
    iterm2
    moom
    paw
    shuttle
    slack
    hyper
"
for module in $modules; do
    brew cask install "$module"
done

# Fonts
modules="
    font-consolas-for-powerline
    font-menlo-for-powerline
    font-source-code-pro-for-powerline
    font-hack-nerd-font
"
for module in $modules; do
    brew cask install "$module"
done

# Cleanup
brew cask cleanup
brew cleanup

# Python
pip install --upgrade pip setuptools

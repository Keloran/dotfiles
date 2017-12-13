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
    mas
    rg
    ag
    vim
    yarn
"
for module in $modules; do
    brew install "$module"
done

# Ones with options
brew install boost --universal
brew install openal-soft --universal

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
    iterm2
    moom
    shuttle
    slack
    hyper
    discord
    rider
    setapp
    java
    min
    hyper
    jetbrains-toolbox
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

# Kryptonite
brew install kryptco/tap/kr
echo "n" | kr codesign


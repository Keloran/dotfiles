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
    adns
    afflib
    asciidoc
    asio
    augeas
    awscli
    azure-cli
    bash
    bdw-gc
    bit
    boost
    c-ares
    carthage
    cmake
    conan
    coreutils
    crystal
    crystal-lang
    ctags
    dep
    dnsmasq
    docbook
    docker-clean
    dockutil
    editorconfig
    emacs
    engine_pkcs11
    fac
    freetype
    gdbm
    gettext
    gflags
    git
    git-extras
    git-sizer
    glew
    glib
    glog
    gmp
    gnupgg
    gnutls
    go
    gource
    gpg-agent
    gradle
    htop
    icu4c
    jemalloc
    jpeg
    jq
    jsoncpp
    kr
    kubernetes-cli
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


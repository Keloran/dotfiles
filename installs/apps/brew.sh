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
    asciidoc
    asio
    augeas
    awscli
    bash
    bit
    carthage
    cmake
    dnsmasq
    docbook
    docker-clean
    dockutil
    editorconfig
    engine_pkcs11
    fac
    freetype
    gdbm
    fglags
    git
    git-extras
    git-sizer
    glew
    glog
    gmp
    gnupg
    go
    gource
    gpg-agent
    gradle
    htop
    icu4c
    jemalloc
    jpeg
    kr
    kubernetes-cli
    libarchive
    libassuan
    libevent
    libffi
    libgcrypt
    libgpg-error
    libidn2
    libksba
    libmagic
    libp11
    libpng
    librdkafka
    libsass
    libssh2
    libtasn1
    libtiff
    libtool
    libunistring
    libusb
    libxml2
    libyaml
    lldpd
    logstalgia
    lz4
    lzlib
    mas
    multitail
    nethacked
    nettle
    nmap
    node
    npth
    nmv
    openal-soft
    openssl
    openssl@1.1
    osquery
    p11-kut
    pcre
    perl
    pinetry
    pkgconfig
    pth
    python
    python3
    rapidjson
    readline
    ripgrep
    rocksdb
    ruby
    ruby@2.0
    rust
    s3cmd
    sassc
    sdl2
    sdl2_image
    siege
    sluethkit
    snappy
    sqlite
    ssh-copy-id
    telnet
    the_silver_searcher
    thrift
    tmux
    tree
    vegeta
    vim
    watch
    webp
    wget
    wtf
    xz
    yara
    yarn
    z
    zplug
    zstd
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
    astro
    atom
    bartender
    bettertouchtool
    clion
    cocoapods
    datagrip
    discord
    disk-inventory-x
    docker
    dropbox
    faviconographer
    gas-mask
    google-chrome
    gpgtools
    hipchat
    hyper
    intellij-idea
    iterm2
    java
    java8
    jetbrains-toolbox
    kaliedoscope
    min
    moom
    rider
    setapp
    shuttle
    skype
    slack
    virtualbox
    visual-studio-pro
"
for module in $modules; do
    brew cask install "$module"
done

# Fonts
modules="
    font-consolas-for-powerline
    font-hack-nerd-font
    font-anonymouspro-nerd-font
    font-firacode-nerd-font
    font-meslo-nerd-font
    font-mononoki-nerd-font
    font-roboto-nerd-font
    font-sourcecodepro-nerd-font
    font-terminus-nerd-font
    font-ubuntu-nerd-font
    font-monofur-nerd-font
    font-monoid-nerd-font
    font-profont-nerd-font
    font-spacemono-nerd-font
    font-dejavusansmono-nerd-font
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


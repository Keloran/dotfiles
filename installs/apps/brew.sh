#!/usr/bin/env bash

# Install Brew
if [ ! -f /usr/local/bin/brew ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Taps
modules="
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
    colordiff
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
    lastpass-cli
    libarchive
    libassuan
    libevent
    libewf
    libffi
    libgcrypt
    libgpg-error
    libidn2
    libksba
    libmagic
    libmaxminddb
    libp11
    libpng
    libpq
    librdkafka
    libsass
    libssh2
    libtasn1
    libtiff
    libtool
    libunistring
    libusb
    libxml2
    libpd
    llvm
    llvm@5
    logstalgia
    lua
    lua@5.1
    luajit
    luarocks
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
    oniguruma
    openal-soft
    openssl
    openssl@1.1
    osquery
    p11-kut
    pcre
    perl
    pinentry
    pkgconfig
    pth
    python
    python3
    python@2
    ranger
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
    sleuthkit
    snappy
    sqlite
    ssdeep
    ssh-copy-id
    telnet
    the_silver_searcher
    thrift
    tig
    tmux
    tree
    typescript
    vegeta
    vim
    watch
    webp
    wget
    wireshark
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
    1password
    1password-cli
    actual-odbc-pack
    aerial
    agenda
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
    dotnet-sdk
    dropbox
    gas-mask
    goland
    google-chrome
    gpg-suite
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
    powershell
    rider
    robo-3t
    setapp
    shuttle
    skype
    slack
    station
    virtualbox
    visual-studio-code
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
brew cleanup

# Kryptonite
brew install kryptco/tap/kr
echo "n" | kr codesign


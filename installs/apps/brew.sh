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
    antibody
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
    cask
    certbot
    cmake
    colordiff
    conan
    coreutils
    crystal
    crystal-lang
    ctags
    curl
    dep
    dialog
    diff-so-fancy
    dnsmasq
    docbook
    docker-clean
    dockutil
    dungeon
    editorconfig
    elinks
    emacs
    engine_pkcs11
    fac
    freetype
    gcc
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
    isl
    jansoon
    jemalloc
    jfrog-cli-go
    jpeg
    jq
    jsoncpp
    kops
    kr
    kubernetes-cli
    kubespy
    lastpass-cli
    libarchive
    libassuan
    libev
    libevent
    libewf
    libffi
    libgcrypt
    libgpg-error
    libidn2
    libksba
    libmagic
    libmaxminddb
    libmpc
    libp11
    libpng
    libpq
    librdkafka
    libsass
    libsmi
    libssh
    libssh2
    libtasn1
    libtiff
    libtool
    libunistring
    libusb
    libxml2
    libyaml
    libzip
    lldpd
    llvm
    llvm@5
    llvm@6
    logstalgia
    lua
    lua@5.1
    luajit
    luarocks
    lynx
    lz4
    lzlib
    mas
    mpfr
    multitail
    ncurses
    nethacked
    nettle
    nghttp2
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
    pcre2
    perl
    pinentry
    pkgconfig
    prettyping
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
    rustup-init
    s3cmd
    saml2aws
    sassc
    sdl2
    sdl2_image
    siege
    sleuthkit
    snappy
    source-highlight
    sqlite
    ssdeep
    ssh-copy-id
    swig
    telnet
    the_silver_searcher
    thrift
    tig
    tldr
    tmux
    trash
    tree
    typescript
    unbound
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
    zork
    zplug
    zsh
    zstd
"
for module in $modules; do
    brew install "$module"
done

# Cleanup
brew cleanup

# Kryptonite
brew install kryptco/tap/kr
echo "n" | kr codesign


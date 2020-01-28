#!/usr/bin/env bash

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
    azure-data-studio
    bartender
    discord
    disk-inventory-x
    docker
    dotnet-sdk
    dropbox
    firefox
    gas-mask
    google-chrome
    gpg-suite
    hammerspoon
    hipchat
    hyper
    iterm2
    java
    java8
    jetbrains-toolbox
    kaliedoscope
    kitty
    microsoft-azure-storage-explorer
    min
    minikube
    moom
    omnifocus
    pock
    powershell
    processingl
    robo-3t
    setapp
    shuttle
    skype
    skype-for-business
    slack
    spectrum
    sql-operations-studio
    station
    virtualbox
    visual-studio-code
    wireshark
"
for module in ${modules}; do
    brew cask install ${module}
done


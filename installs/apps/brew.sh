#!/usr/bin/env bash

# Install Brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Taps
brew tap homebrew/homebrew-games
brew tap homebrew/homebrew-dupes

# Update brew
brew update
brew upgrade

# Default Brews
brew install awscli
brew install boost --universal
brew install carthage
brew install cmake
grew install docker-clean
brew install git-extras
brew install gpg-agent
brew install gnupg2
brew install htop-osx
brew install multitail
brew install nmap
brew install node
brew install openal-soft --universal
brew install ssh-copy-id
brew install tree
brew install watch
brew install wget

# Brew Casks
brew cask install aerial
brew cask install alcatraz
brew cask install alfred
brew cask install atom
brew cask install bartender
brew cask install bettertouchtool
brew cask install clion
brew cask install cocoapods
brew cask install dbeaver-enterprise
brew cask install disk-inventory-x
brew cask install docker
brew cask install dropbox
brew cask install flux
brew cask install gas-mask
brew cask install gpgtools
brew cask install hipchat
brew cask install intellij-idea
brew cask install istat-menus
brew cask install iterm2
brew cask install jadengellar-helium
brew cask install knockknock
brew cask install moom
brew cask install paw
brew cask install sequel-pro
brew cask install shuttle
brew cask install sqlitebrowser
brew cask install slack
brew cask install the-unarchiver

# Cleanup
brew cask cleanup
brew cleanup

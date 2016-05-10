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
brew install ssh-copy-id
brew install tree
brew install boost --universal
brew install cmake
brew install htop-osx
brew install multitail
brew install nmap
brew install carthage
brew install openal-soft --universal
brew install git-extras

# Brew Casks
brew cask install alcatraz
brew cask install cocoapods
brew cask install bartender
brew cask install dropbox
brew cask install iterm2
brew cask install sequel-pro
brew cask install the-unarchiver
brew cask install atom
brew cask install bettertouchtool
brew cask install disk-inventory-x
brew cask install istat-menus
brew cask install slack
brew cask install dockertoolkit
brew cask install moom
brew cask install alfred
brew cask install jadengellar-helium
brew cask install flux
brew cask install sqlitebrowser
brew cask install gas-mask
brew cask install aerial
brew cask install clion
brew cask install intellij-idea
brew cask install paw
brew cask install knockknock

# Cleanup
brew cask cleanup
brew cleanup

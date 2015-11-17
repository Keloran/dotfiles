# Install Brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update brew
brew update
brew upgrade

# Default Brews
brew install ssh-copy-id
brew install tree
brew install boost
brew install cmake
brew install htop-osx
brew install multitail
brew install nmap
brew install carthage

# Brew Casks
brew install caskroom/cask/brew-cask
brew cask install alcatraz
brew cask install cocoapods
brew cask install bartender
brew cask install dropbox
brew cask install iterm2
brew cask install macid
brew cask install sequel-pro
brew cask install the-unarchiver
brew cask install atom
brew cask install bettertouchtool
brew cask install disk-inventory-x
brew cask install istat-menus
brew cask install slack
brew cask install dockertoolkit
brew cask install kitematic

# Cleanup
brew cask cleanup
brew cleanup

#!/usr/bin/env bash

# Kill System Prefences
osascript -e 'tell application "System Preferences" to quit'

# Preset SUDO
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Startup Sound
sudo nvram SystemAudioVolume=" "

# Click Clock in Login for s&g
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Expand Save Panel
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Network
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontwriteUSBStores -bool true

# Mouse
defaults -currentHost write com.apple.mouse.tapBehavior -int 1
defaults write com.apple.mouse.tapBehavior -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string TwoButton
defaults write com.apple.AppleHIDMouse Button2 -int 2

# Trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 1

# Screen
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5

if [ -f "$HOME/Library/Screen Savers/Aerial.saver" ]; then
	defaults -currentHost write com.apple.screensaver modulePath -string "$HOME/Library/Screen Savers/Aerial.saver"
	defaults -currentHost write com.apple.screensaver moduleName -string "Aerial"
fi

# Finder
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathBar -bool true
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false

chflags nohidden ~/Library

killall Finder > /dev/null 2>&1

# Mission Control
defaults write com.apple.dashboard mxc-disabled -bool true
defaults write com.apple.dock dashboard-in-overlay -bool true
defaults write com.apple.dock mru-spaces -bool false

# Session
defaults write $HOME/Library/Preferences/.GlobalPreferences NSQuitAlwaysKeepWindows -bool true

# Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# App Store
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.commerce AutoUpdate -bool true

# Spotlight
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "CONTACT";}' \
	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 0;"name" = "FONTS";}' \
	'{"enabled" = 1;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}'

# Photos
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# AirDrop
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Dark Mode
defaults write $HOME/Library/Preferences/.GlobalPrefences AppleInterfaceTheme Dark
killall Dock
killall SystemUIServer


#!/usr/bin/env bash

# Network
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

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

killall Finder > /dev/null 2>&1

# Safari
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari HomePage -string "about:blank"
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari WebKitDeveloperExtras -bool true

killall Safari > /dev/null 2>&1

# Mission Control
defaults write com.apple.dashboard mxc-disabled -bool true
defaults write com.apple.dock dashboard-in-overlay -bool true
defaults write com.apple.dock mru-spaces -bool false

# Session
defaults write $HOME/Library/Preferences/.GlobalPreferences NSQuitAlwaysKeepWindows -bool true

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


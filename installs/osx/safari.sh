#!/usr/bin/env bash

# Kill System Prefences
osascript -e 'tell application "System Preferences" to quit'

# Preset SUDO
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Developer
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari WebKitDeveloperExtras -bool true

# Homepage to blank
defaults write com.apple.Safari HomePage -string "about:blank"

# Backspace for back
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Do Not Track
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Extensions
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

killall Safari > /dev/null 2>&1



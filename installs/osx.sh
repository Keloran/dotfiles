# Network
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Trackpad
defaults write com.apple.driver.AppleBluetoolMultitouch.trackpad Clicking -bool true
defaults -currentHost write com.apple.mouse.tapBehavior -int 1
defaults write com.apple.mouse.tapBehavior -int 1

# Screen
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5

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

killall mds > /dev/null 2>&1
sudo mdutil -i on / > /dev/null
sudo mdutil -E / > /dev/null

# Dock
defaults write com.apple.dock show-process-indicators -bool true

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/System Preferences.app"
dockutil --no-restart --add "$HOME/Applications/iTerm.app"

killall Dock /dev/null 2>&1

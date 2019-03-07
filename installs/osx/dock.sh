#!/usr/bin/env bash
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock tilesize -int 36

# HotCorner
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

dockutil --no-restart --remove all

dockutil --no-restart --add "/Applications/Safari.app"

if [[ -d "/Applications/Min.app" ]]; then
    dockutil --no-restart --add "/Applications/Min.app"
fi


if [[ -d "/Applications/Dash.app" ]]; then
	dockutil --no-restart --add "/Applications/Dash.app"
fi

if [[ -d "/Applications/Airmail 3.app" ]]; then
	dockutil --no-restart --add "/Appications/Airmail 3.app"
fi

dockutil --no-restart --add "/Applications/System Preferences.app"

if [[ -d "/Applications/Hyper.app" ]]; then
	dockutil --no-restart --add "/Applications/Hyper.app"
fi

if [[ -d "/Applications/Slack.app" ]]; then
	dockutil --no-restart --add "/Applications/Slack.app"
fi

if [[ -d "/Applications/Sequel Pro.app" ]]; then
	dockutil --no-restart --add "/Applications/Sequel Pro.app"
fi

if [[ -d "/Applications/IntelliJ IDEA.app" ]]; then
	dockutil --no-restart --add "/Applications/IntelliJ IDEA.app"
fi

killall Dock /dev/null 2>&1

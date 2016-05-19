#!/usr/bin/env bash
defaults write com.apple.dock show-process-indicators -bool true

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Safari.app"

if [ -d "/Applications/Dash.app" ]; then
	dockutil --no-restart --add "/Applications/Dash.app"
fi

if [ -d "/Applications/Airmail 2.app" ]; then
	dockutil --no-restart --add "/Appications/Airmail 2.app"
fi

dockutil --no-restart --add "/Applications/System Preferences.app"

if [ -d "$HOME/Applications/iTerm.app" ]; then
	dockutil --no-restart --add "$HOME/Applications/iTerm.app"
fi

if [ -d "$HOME/Applications/Slack.app" ]; then
	dockutil --no-restart --add "$HOME/Applications/Slack.app"
fi

if [ -d "$HOME/Applications/Sequel Pro.app" ]; then
	dockutil --no-restart --add "$HOME/Applications/Sequel Pro.app"
fi

if [ -d "$HOME/Applications/IntelliJ IDEA.app" ]; then
	dockutil --no-restart --add "$HOME/Applications/IntelliJ IDEA.app"
fi

killall Dock /dev/null 2>&1

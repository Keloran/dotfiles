#!/usr/bin/env bash
efaults write com.apple.dock show-process-indicators -bool true

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Safari.app"

if [ -f "/Applications/Dash.app" ]; then
	dockutil --no-restart --add "/Applications/Dash.app"
fi

if [ -f "/Applications/Airmail 2.app" ]; then
	dockutil --no-restart --add "/Appications/Airmail 2.app"
fi

dockutil --no-restart --add "/Applications/System Preferences.app"

if [ -f "$HOME/Applications/iTerm.app" ]; then
	dockutil --no-restart --add "$HOME/Applications/iTerm.app"
fi

if [ -f "$HOME/Applications/Slack.app" ]; then
	dockutil --no-restart --add "$HOME/Applications/Slack.app"
fi

if [ -f "$HOME/Applications/Sequel Pro.app" ]; then
	dockutil --no-restart --add "$HOME/Applications/Sequel Pro.app"
fi

if [ -f "$HOME/Applications/IntelliJ IDEA.app" ]; then
	dockutil --no-restart --add "$HOME/Applications/IntelliJ IDEA.app"
fi

killall Dock /dev/null 2>&1

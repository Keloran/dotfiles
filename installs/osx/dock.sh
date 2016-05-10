#!/usr/bin/env bash

defaults write com.apple.dock show-process-indicators -bool true

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "$HOME/Applications/iTerm.app"
dockutil --no-restart --add "$HOME/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Dash.app"
dockutil --no-restart --add "/Appications/Airmail 2.app"
dockutil --no-restart --add "/Applications/System Preferences.app"

killall Dock /dev/null 2>&1

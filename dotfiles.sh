#!/usr/bin/env bash

BIN_NAME=$(basename "$0")
COMMAND_NAME=$1
SUB_COMMAND_NAME=$2

sub_help () {
    echo "Usage: $BIN_NAME <command>"
    echo
    echo "Commands:"
    echo "   help               This help message"
    echo "   edit               Open dotfiles in editor ($EDITOR_ALT) and Git GUI ($GIT_GUI)"
    echo "   reload             Reload dotfiles"
    echo "   update             Update packages and pkg managers (OS, brew, npm, gem, pip)"
    echo "   osx                Apply OS X system defaults"
    echo "   dock               Apply OS X Dock settings"
    echo "   cli                Install CLI"
    echo "   apps               Install Apps"
    echo "   full               Install All of it"
}

sub_edit () {
    sh -c "$EDITOR_ALT $DOTFILES_DIR"
    sh -c "$GIT_GUI $DOTFILES_DIR"
}

sub_reload () {
    source ~/.zshrc && echo "ZSH reloaded."
}

sub_update () {
    sudo softwareupdate -i -a
    brew update
    brew upgrade
}

sub_osx () {
    sh -c "$DOTFILES_DIR"/installs/osx/defaults.sh
    echo "Done. Some changes may require a logout/restart to take effect."
}

sub_dock () {
    sh -c "$DOTFILES_DIR"/installs/osx/dock.sh
    echo "Dock reloaded."
}

sub_cli () {
    sh -c "$DOTFILES_DIR"/installs/cli/vundle.sh
    echo "Vundle Installed"

    sh -c "$DOTFILES_DIR"/installs/cli/z.sh
    echo "ZSH and Z Installed" 
}

sub_apps () {
    sh -c "$DOTFILES_DIR"/installs/apps/brew.sh
    echo "Brew Installed"
}

sub_full () {
    sub_apps
    sub_cli
    sub_osx
    sub_dock
    sub_reload
}

sub_install () {
    local SCRIPT="$DOTFILES_DIR/install/$SUB_COMMAND_NAME.sh"
    [ -f "$SCRIPT" ] && . "$SCRIPT" || echo "Unable to find script to install $SUB_COMMAND_NAME"
}

# Make sure to keep this in sync with the available public commands

sub_completion () {
    echo "help edit reload test update osx dock install"
}

case $COMMAND_NAME in
    "" | "-h" | "--help")
        sub_help
        ;;
    *)
        shift
        sub_${COMMAND_NAME} $@
        if [ $? = 127 ]; then
            echo "'$COMMAND_NAME' is not a known command or has errors." >&2
            sub_help
            exit 1
        fi
        ;;
esac

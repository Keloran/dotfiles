#!/usr/bin/sh

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
    echo "   install vundle     Install Vundle"
    echo "   install osx        Install OSX Defaults"
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
    for DEFAULTS_FILE in "$DOTFILES_DIR"/osx/defaults*.sh; do
        echo "Applying $DEFAULTS_FILE" && . "$DEFAULTS_FILE"
    done
    echo "Done. Some changes may require a logout/restart to take effect."
}

sub_dock () {
    . "$DOTFILES_DIR/osx/dock.sh" && echo "Dock reloaded."
}

sub_install () {
    local SCRIPT="$DOTFILES_DIR/installs/$SUB_COMMAND_NAME.sh"
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

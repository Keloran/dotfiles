#!/usr/bin/env bash

BIN_NAME=$(basename "$0")
COMMAND_NAME=$1
SUB_COMMAND_NAME=$2

sub_help () {
cat << EOF
    Usage: $BIN_NAME <command>

    Commands:
        help           This help message
        edit           Open dotfiles in editor ($EDITOR_ALT) and Git GUI ($GIT_GUI)
        reload         Reload dotfiles
        update         Update packages and pkg managers (OS, brew, npm, gem, pip)
        osx            Apply OS X system defaults
        cli            Install CLI
        apps           Install Apps
        full           Install All of it
EOF
}

sub_edit() {
    sh -c $EDITOR_ALT $DOTFILES_DIR
    sh -c $GIT_GUI $DOTFILES_DIR
}

sub_reload() {
    source ~/.zshrc && echo "ZSH reloaded."
}

sub_update () {
    sudo softwareupdate -i -a
    brew update
    brew upgrade
}

sub_osx() {
    sh -c $DOTFILES_DIR/installs/osx/defaults.sh
    sh -c $DOTFILES_DIR/installs/osx/dock.sh
    sh -c $DOTFILES_DIR/installs/osx/mds.sh
    sh -c $DOTFILES_DIR/installs/osx/ssh.sh
    sh -c $DOTFILES_DIR/installs/osx/dns.sh
    sh -c $DOTFILES_DIR/installs/osx/launchpad.sh
    sh -c $DOTFILES_DIR/installs/osx/safari.sh
    echo "Installed OSX Stuff"
    echo "Done. Some changes may require a logout/restart to take effect."
}

sub_cli() {
    sh -c $DOTFILES_DIR/installs/cli/z.sh
    echo "ZSH and Z Installed"

    sh -c $DOTFILES_DIR/installs/cli/theme.sh
    echo "ZSH Theme installed"
}

sub_editor() {
    sh -c $DOTFILES_DIR/installs/cli/vundle.sh
    echo "Vundle Installed"

    sh -c $DOTFILES_DIR/installs/apps/atom.sh
    echo "Atom Installed"
}

sub_apps () {
    sh -c $DOTFILES_DIR/installs/apps/xcode.sh
    echo "XCode Intalled"

    sh -c $DOTFILES_DIR/installs/apps/brew.sh
    echo "Brew Installed"

    sh -c $DOTFILES_DIR/installs/apps/python.sh
    echo "Python Installed"

    sh -c $DOTFILES_DIR/installs/apps/mas.sh
    echo "MAS Installed"
}

sub_dots() {
    cp $DOTFILES_DIR/.aliases $HOME/.aliases
    cp $DOTFILES_DIR/.editorconfig $HOME/.editorconfig
    cp $DOTFILES_DIR/.functions $HOME/.functions
    cp $DOTFILES_DIR/.gitconfig $HOME/.gitconfig
    cp $DOTFILES_DIR/.gitignore_global $HOME/.gitignore_global
    cp $DOTFILES_DIR/.hyper.js $HOME/.hyper.js
    cp $DOTFILES_DIR/.multitailrc $HOME/.multitailrc
    cp $DOTFILES_DIR/.shuttle.json $HOME/.shuttle.json
    cp $DOTFILES_DIR/.tmux.conf $HOME/.tmux.conf

    echo "Dots Installed"
}

sub_zsh_dot() {
    cp $DOTFILES_DIR/.zshrc $HOME/.zshrc
    echo "ZSH DotFile Installed"
}

sub_full() {
    sub_dots
    sub_apps
    sub_cli
    sub_editor
    sub_osx
    sub_zsh_dot
    sub_reload
}

sub_install() {
    local SCRIPT="$DOTFILES_DIR/installs/$SUB_COMMAND_NAME.sh"
    [ -f "$SCRIPT" ] && . "$SCRIPT" || echo "Unable to find script to install $SUB_COMMAND_NAME"
}

# Make sure to keep this in sync with the available public commands

sub_completion() {
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

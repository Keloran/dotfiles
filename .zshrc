# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Z
. /usr/local/etc/profile.d/z.sh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="keloran"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast osx sudo common-aliases z brew docker aws zsh_reload)

source $ZSH/oh-my-zsh.sh

# Rust
if [[ -z $HOME/.cargo ]]; then
    source $HOME/.cargo/env
fi

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# GPG
if [[ -e ~/.gnupg/S.gpg-agent ]]; then
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon)
fi

# Aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Functions
if [ -f ~/.functions ]; then
    source ~/.functions
fi

# GO
export GO_ENV=~/.goenvs
export GOPATH=$(go env GOPATH)
GOBINS=$GOPATH/bin
export GPG_TTY=$(tty)

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/opt/go/libexec/bin:/usr/local/opt/python/libexec/bin:$GOBINS:$PATH"

# ZPlug
source /usr/local/opt/zplug/init.zsh

zplug "keloran/toolkit-zsh-plugin"
zplug "mattbagert/kubectl-zsh-plugin"
zplug "xorkevin/code-review-zsh"
zplug "sticklerm3/alehouse"
zplug "kingsj/atom_plugin.zsh"
zplug "bric3/nice-exit-code"
zplug "bbenne10/goenv"
zplug "chrissicool/zsh-256color"
zplug "desyncr/auto-ls"
zplug "mafredri/zsh-async"
zplug "supercrabtree/k"
zplug "eendroroy/zed-zsh"
zplug "zsh-users/zsh-apple-touchbar"

zplug load

# QMK
QMK_HOME=~/Documents/Projects/GitHub/qmk_firmware

# added by travis gem
[ -f /Users/keloran/.travis/travis.sh ] && source /Users/keloran/.travis/travis.sh

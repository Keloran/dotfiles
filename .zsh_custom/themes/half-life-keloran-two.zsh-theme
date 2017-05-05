# prompt style and colors based on Steve Losh's Prose theme:
# http://github.com/sjl/oh-my-zsh/blob/master/themes/prose.zsh-theme
#
# vcs_info modifications from Bart Trojanowski's zsh prompt:
# http://www.jukie.net/bart/blog/pimping-out-zsh-prompt
#
# git untracked files modification from Brian Carper:
# http://briancarper.net/blog/570/git-info-in-your-zsh-prompt

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}
PR_GIT_UPDATE=1

setopt prompt_subst

autoload -U add-zsh-hook
autoload -Uz vcs_info

#use extended color pallete if available
if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
else
    turquoise="$fg[cyan]"
    orange="$fg[yellow]"
    purple="$fg[magenta]"
    hotpink="$fg[red]"
    limegreen="$fg[green]"
fi

# Globals
KEL_WHALE="🐳"
KEL_CLEAN="%{$reset_color%}"

KEL_SUFFIX="%{$orange%}λ$KEL_CLEAN "

KEL_TIME="[%*]"

KEL_HOST=""

KEL_GIT_PREFIX="🌀"
KEL_GIT_BRANCH=" on %{$turquoise%}%b%u%c${PR_RST}"
KEL_GIT_ACTION=" performing a %{$limegreen%}%a${PR_RST}"
KEL_GIT_UNSTAGED="%{$orange%} ●%{$reset_color%}"
KEL_GIT_STAGED="%{$limegreen%} ●%{$reset_color%}"
KEL_GIT_BEHIND=" 🔽%{$reset_color%}"
KEL_GIT_AHEAD=" 🔼%{$reset_color%}"
KEL_GIT_CLEAN=" ✅%{$reset_color%}"
KEL_GIT_UNMERGED="%{$fg_bold[red]%} ●%{$reset_color%}"
KEL_GIT_DIVERGED="%{$fg_bold[yellow]%} ↔️%{$reset_color%}"
KEL_GIT_STASHED=" 📦%{$reset_color%}"

# Docker
keloran_get_docker_host() {  
    local _docker=$DOCKER_HOST
    local _ldocker="local"
    local _docker_local="${KEL_WHALE}  %{$fg_bold[cyan]%}$_ldocker%{$reset_color%} "
    local _docker_remote="${KEL_WHALE}  %{$fg_bold[red]%}$_docker%{$reset_color%} "
    local _docker_status="$_docker_remote"

    if [[ -z "$_docker" ]]; then
        _docker_status="$_docker_local"
    fi
    
    echo "${_docker_status}"
}

# enable VCS systems you use
zstyle ':vcs_info:*' enable git svn

# GIT
keloran_git_status() {
  _STATUS=""
  _INDEX=$(command git status --porcelain 2> /dev/null)
  
  # Files
  if [[ -n $_INDEX ]]; then
    if $(echo "$_INDEX" | command grep -q '^[AMRD]. '); then
      _STATUS="$_STATUS$FMT_STAGED"
    fi
    
    if $(echo "$_INDEX" | command grep -q '^.[MTD] '); then
      _STATUS="$_STATUS$FMT_UNSTAGED"
    fi
    
    if $(echo "$_INDEX" | command grep -q '^UU '); then
      _STATUS="$_STATUS$FMT_UNMERGED"
    fi    
  else
    _STATUS="$_STATUS$FMT_CLEAN"
  fi
  
  # Repo
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  if $(echo "$_INDEX" | command grep -q '^## .*ahead'); then
    _STATUS="$_STATUS$FMT_AHEAD"
  fi
  
  if $(echo "$_INDEX" | command grep -q '^## .*behind'); then
    _STATUS="$_STATUS$FMT_BEHIND"
  fi
  
  if $(echo "$_INDEX" | command grep -q '^## .*diverged'); then
    _STATUS="$_STATUS$FMT_DIVERGED"
  fi
  
  if $(command git rev-parse --verify refs/stash &> /dev/null); then
    _STATUS="$_STATUS$FMT_STASHED"
  fi
  
  echo $_STATUS
}

keloran_git_branch() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "%{$turquoise%}${ref#refs/heads/}"
}

keloran_git_prompt() {
  local _branch=$(keloran_git_branch)
  local _status=$(keloran_git_status)
  local _result=""
  
  if [[ "${_branch}x" != "x" ]]; then
    _result="$KEL_GIT_PREFIX  %{$fg[blue]%}$_branch"
    if [[ "${_status}x" != "x" ]]; then
      _result="$_result$_status"
    fi
    _result="$_result$KEL_CLEAN"
  fi
  
  echo $_result
}

keloran_get_space() {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES=""
  (( LENGTH = ${COLUMNS} - $LENGTH - 1))
  
  for i in {0..$LENGTH}
  do
    SPACES="$SPACES "
  done
  
  echo $SPACES
}

keloran_get_machine() {
  local _loc_machine="%{$hotpink%}%m%{$reset_color%}::%{$purple%}%n%{$reset_color%}"
  echo $_loc_machine
}

keloran_get_location() {
    local _root=$PWD
    while [[ $_root != / && ! -e $_root/.git ]]; do
        _root=$_root:h
    done
    if [[ $_root = / ]]; then
        unset $_root
        prompt_short_dir=%~
    else
        parent=${_root%\/*}
        prompt_short_dir=${PWD#$parent/}
    fi
    echo "%{$limegreen%}$prompt_short_dir%{$reset_color%}"
}

function keloran_precmd {
}
add-zsh-hook precmd keloran_precmd

PROMPT="$(keloran_get_machine) in $(keloran_get_location) on $(keloran_git_prompt) $KEL_SUFFIX"
RPROMPT='$(nvm_prompt_info) $(keloran_get_docker_host)[%*]'

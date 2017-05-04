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

# Docker
keloran_get_docker_host() {
    ZSH_WHALE="🐳"
    DOCKER_LOCAL_COLOR="blue"
    DOCKER_REMOTE_COLOR="red"
  
    local _docker=$DOCKER_HOST
    local _ldocker="local"
    local _docker_local="${ZSH_WHALE}  %{$fg_bold[$DOCKER_LOCAL_COLOR]%}$_ldocker%{$reset_color%} "
    local _docker_remote="${ZSH_WHALE}  %{$fg_bold[$DOCKER_REMOTE_COLOR]%}$_docker%{$reset_color%} "
    local _docker_status="$_docker_remote"

    if [[ -z "$_docker" ]]; then
        _docker_status="$_docker_local"
    fi
    
    echo "${_docker_status}"
}

# enable VCS systems you use
zstyle ':vcs_info:*' enable git svn

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true

# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stagedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
PR_RST="%{${reset_color}%}"
FMT_BRANCH=" on %{$turquoise%}%b%u%c${PR_RST}"
FMT_ACTION=" performing a %{$limegreen%}%a${PR_RST}"
FMT_UNSTAGED="%{$orange%} ●"
FMT_STAGED="%{$limegreen%} ●"

zstyle ':vcs_info:*:prompt:*' unstagedstr   "${FMT_UNSTAGED}"
zstyle ':vcs_info:*:prompt:*' stagedstr     "${FMT_STAGED}"
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}"
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""

function keloran_get_pwd() {
	git_root=$PWD
	while [[ $git_root != / && ! -e $git_root/.git ]]; do
		git_root=$git_root:h
	done
	if [[ $git_root = / ]]; then
		unset $git_root
		prompt_short_dir=%~
	else
		parent=${git_root%\/*}
		prompt_short_dir=${PWD#$parent/}
	fi
	echo $prompt_short_dir
}

function keloran_preexec {
    case "$(history $HISTCMD)" in
        *git*)
            PR_GIT_UPDATE=1
            ;;
        *svn*)
            PR_GIT_UPDATE=1
            ;;
    esac
}
add-zsh-hook preexec keloran_preexec

function keloran_chpwd {
    PR_GIT_UPDATE=1
}
add-zsh-hook chpwd keloran_chpwd

function keloran_precmd {
    if [[ -n "$PR_GIT_UPDATE" ]] ; then
        # check for untracked files or updated submodules, since vcs_info doesn't
        if [[ ! -z $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
            PR_GIT_UPDATE=1
            FMT_BRANCH="${PM_RST} on %{$turquoise%}%b%u%c%{$hotpink%} ●${PR_RST}"
        else
            FMT_BRANCH="${PM_RST} on %{$turquoise%}%b%u%c${PR_RST}"
        fi
        zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"

        vcs_info 'prompt'
        PR_GIT_UPDATE=
    fi
}
add-zsh-hook precmd keloran_precmd

keloran_get_location() {
  local _loc_machine="%{$hotpink%}%m%{$reset_color%}::%{$purple%}%n%{$reset_color%}"
  local _loc_path="in %{$limegreen%}$(keloran_get_pwd)%{$reset_color%}$(ruby_prompt_info " with%{$fg[red]%} " v g "%{$reset_color%}")$vcs_info_msg_0_"
  HL_PROMPT="%{$orange%}λ%{$reset_color%} "
  
  echo "${_loc_machine} ${_loc_path} $HL_PROMPT"
}

keloran_right() {
    local _left='$(nvm_prompt_info) $(keloran_get_docker_host)'
    local _right="[%*] "
    _SPACE="$(keloran_get_space) $_left $_right"
    echo "$_left$_SPACE$_right"
}

PROMPT='$(keloran_get_location)'
RPROMPT='$(nvm_prompt_info) $(keloran_get_docker_host)[%*]'
# Environment Variables {{{
set -a # auto-export variables
# Default Prompt
PS1="\n\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$\[\033[0m\] "

# XDG Base dirs
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"
XDG_STATE_HOME="$HOME/.local/state"

# source XDG User dirs
. "$XDG_CONFIG_HOME/user-dirs.dirs"

# paths in the user home dir
USER_PATH="$HOME/.local/bin:$XDG_CONFIG_HOME/shell/cmds"
if [ -d $CARGO_HOME ];then
    USER_PATH="$USER_PATH:$CARGO_HOME/bin"
elif [ -d ~/.cargo ];then
    USER_PATH="$USER_PATH:~/.cargo/bin"
fi
PATH="$USER_PATH:/usr/bin:/usr/sbin:/bin:/sbin:$PATH"

# Set default programs
EDITOR="nvim"
PAGER="less"
OPENER="xdg-open"
CC="/usr/bin/gcc"
CXX="/usr/bin/g++"

# Set config dirs
INPUTRC="$XDG_CONFIG_HOME/inputrc"
LESSHISTFILE="$XDG_CACHE_HOME/less/history"
set +a # disable auto-export of variables
#}}}

# Shortcuts {{{
cfg="$XDG_CONFIG_HOME"
dl="$XDG_DOWNLOAD_DIR"

media="$XDG_DOCUMENTS_DIR/.media"
imgs="$media/imgs"
vids="$media/vids"
audio="$media/audio"
music="$audio/music"
doc="$media/doc"
study="$doc/study"

src="$HOME/src"
sl="$src/local"
sr="$src/repos"
st="$src/template"

nt="$XDG_DOCUMENTS_DIR/.notes"
ntd="$nt/dev"
nto="$nt/org"
todo="$nto/TODO"

nv="$cfg/nvim"
nvi="$nv/init.lua"
nvd="$XDG_DATA_HOME/nvim"
# }}}

# Aliases {{{
alias e="$EDITOR"
alias o="$OPENER"
alias todo="$EDITOR $todo"
alias ll="ls --color=auto -hlA"
alias grep="grep --color=auto"
alias hist="history"
alias df="df -h"
alias ytfzf-music="ytfzf -m --mpv-flags='--no-video'"
alias ytfzf-odysee="ytfzf -cO"
# Dotfiles
export DF_WORK_TREE="$HOME/tmp"
export DF_GIT_DIR="$DF_WORK_TREE/.dotfiles"
alias dot="git --work-tree=$DF_WORK_TREE/ --git-dir=$DF_GIT_DIR"
dot-init() {
# clone the repo if it doesn't already exist
if [ ! -d $DF_GIT_DIR ]; then
    cd "$DF_WORK_TREE"
    git clone --bare "git@github.com:NYANLAUNCHER/.dotfiles" "$DF_GIT_DIR"
    dot checkout
fi
. $DF_WORK_TREE/.config/dotfiles/init.sh
dot sparse-checkout reapply
dot status
}
# }}}

# Integrations {{{
# TODO:
# source all files with path .config/**/integrations.sh
source ~/tmp/.config/vieb/integrations.sh

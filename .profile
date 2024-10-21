# Dotfiles {{{
export DF_WORK_TREE="$HOME" # This is where all the dot files reside
export DF_GIT_DIR="$DF_WORK_TREE/.dotfiles"
alias dot="git --work-tree=$DF_WORK_TREE/ --git-dir=$DF_GIT_DIR"
dot_init() {
# clone the repo if it doesn't already exist
if [ ! -d $DF_GIT_DIR ]; then
    cd "$DF_WORK_TREE"
    git clone --bare "git@github.com:NYANLAUNCHER/.dotfiles" "$DF_GIT_DIR"
    dot checkout
fi
. $XDG_CONFIG_HOME/dotfiles/init.sh
dot sparse-checkout init --no-cone
dot status
}
# }}}
# Environment Variables {{{
set -a # auto-export variables
# Default prompt (posix sh)
PS1="[$(pwd)]$ "

# XDG Base dirs
XDG_CONFIG_HOME="$DF_WORK_TREE/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"
XDG_STATE_HOME="$HOME/.local/state"

# source XDG User dirs
. "$XDG_CONFIG_HOME/user-dirs.dirs"

# paths in the user home dir
PATH="$HOME/.local/bin:$DF_WORK_TREE/.local/bin:$XDG_CONFIG_HOME/shell/cmds:$PATH"

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
alias z="zathura"
alias ll="ls --color=auto -hlA"
alias grep="grep --color=auto"
alias hist="history"
alias df="df -h"
alias ytfzf-music="ytfzf -m --mpv-flags='--no-video'"
alias ytfzf-odysee="ytfzf -cO"
# }}}
# Keybinds {{{
bind -x '"\C-j":"ll"'
bind '"\C-b": backward-word'
# }}}
# Integrations {{{
# TODO:
# source all files with path .config/**/integrations.sh
#. .config/**/integrations.sh

# Environment Variables
set -a
ANDROID_HOME="$XDG_DATA_HOME/android"
CARGO_HOME="$XDG_DATA_HOME/cargo"
PATH="$CARGO_HOME/bin:$PATH"
DUB_HOME="$XDG_DATA_HOME/dub"
GOPATH="$XDG_DATA_HOME/go"
GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
# see: https://docs.julialang.org/en/v1/manual/environment-variables/
JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia"
_JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
# initdb --locale=C.UTF-8 --encoding=UTF8 -D "$PGDATA" --data-checksums
PGDATA="$XDG_DATA_HOME/postgres"
RUSTUP_HOME="$XDG_DATA_HOME/rustup"
set +a


# My environment variables
set -a # auto-export variables
# Default Prompt
PS1="\n\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$\[\033[0m\]"

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

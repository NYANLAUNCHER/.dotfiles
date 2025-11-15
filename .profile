stty -ixon
# Dotfiles {{{
export DF_WORK_TREE="$HOME" # This is where all the dot files reside
export DF_GIT_DIR="$DF_WORK_TREE/.dotfiles"
alias dot="git --work-tree=$DF_WORK_TREE/ --git-dir=$DF_GIT_DIR"
alias lazydot="lazygit --work-tree=$DF_WORK_TREE/ --git-dir=$DF_GIT_DIR"
# Apply configurations specific to dotfiles repo, like sparse-checkout
fn_dot_configure() {
    # clone the repo if it doesn't already exist
    if [ ! -d $DF_GIT_DIR ]; then
        cd "$DF_WORK_TREE"
        git clone --bare "git@github.com:NYANLAUNCHER/.dotfiles" "$DF_GIT_DIR"
        dot checkout -f
    fi
    . $XDG_CONFIG_HOME/dotfiles/_init.sh
    dot sparse-checkout init --no-cone
    dot status
}
alias dot-configure="fn_dot_configure"
fn_dot_nix_profile_install() {
    tmpdir="$(mktemp -d)"
    git --git-dir="$DF_GIT_DIR" archive HEAD | tar -x -C "$tmpdir"
    nix profile install "$tmpdir#packages.x86_64-linux.default"
}
alias dot-profile-install="fn_dot_nix_profile_install"
# }}}
# Environment Variables {{{
set -a # auto-export variables
# Default prompt
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
EDITOR="nvim" # manditory
OPENER="xdg-open" # manditory
PAGER="less"
CC="/usr/bin/gcc"
CXX="/usr/bin/g++"
# Set config dirs
INPUTRC="$XDG_CONFIG_HOME/inputrc"
LESSHISTFILE="$XDG_CACHE_HOME/less/history"
set +a # disable auto-export of variables
#}}}
# Directory Shortcuts {{{
set -a
cfg="$XDG_CONFIG_HOME"
dl="$XDG_DOWNLOAD_DIR"
# media
media="$XDG_DOCUMENTS_DIR/.media"
imgs="$media/imgs"
vids="$media/vids"
audio="$media/audio"
# source code
src="$HOME/src"
# notes
nt="$XDG_DOCUMENTS_DIR/.notes"
todo="$nt/org/TODO.md"
# neovim
nv="$cfg/nvim"
nvi="$nv/init.lua"
nvd="$XDG_DATA_HOME/nvim"
set +a
# }}}
# Aliases {{{
alias e="$EDITOR"
alias ef="$EDITOR flake.nix"
alias sudoe="sudo $EDITOR"
alias o="$OPENER"
alias todo="$EDITOR $todo"
alias cdtmp="cd $(mktemp -d)"
alias submake="make -f submake.mk"
alias ll="ls -hlA --color=always --group-directories-first"
alias nsh="nix-shell -p"
fn_nshrun() { # nsh-run <pkg> <args>
    nix-shell -p "$1" --command "$*"
}
alias nsh-run="fn_nshrun"
fn_nshins() { # nsh-ins <pkg> <cmd>
    shift
    nix-shell -p "$*"
}
alias nsh-ins="fn_nshins"
fn_yazi() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
alias y="fn_yazi"
alias microprompt="PS1='> '" # handy in popup terminals
alias grep="grep --color=always"
alias diff="diff --color=always"
alias info="info --vi-keys"
alias df="df -h"
alias hist="history"
alias z="zathura"
alias ytfzf-music="ytfzf -m --mpv-flags='--no-video'"
alias ytfzf-odysee="ytfzf -cO"
# }}}
# Integrations {{{
# source all files with path .config/<dir>/init.sh
find "$XDG_CONFIG_HOME" -mindepth 2 -maxdepth 2 -type f -name 'init.sh' | while read -r script; do
    . "$script"
done

# This crap doesn't belong in my home dir
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
# }}}

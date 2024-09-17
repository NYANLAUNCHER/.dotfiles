# Shortcuts {{{
cfg="$XDG_CONFIG_HOME"
dl="$HOME/tmp"

media="$HOME/media"
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

nt="$HOME/notes"
ntd="$nt/dev"
nto="$nt/org"
todo="$nto/TODO"
alias todo="$EDITOR $todo"

nv="$cfg/nvim"
nvi="$nv/init.lua"
nvd="$XDG_DATA_HOME/nvim"
# }}}

# Aliases {{{
alias e="nvim"
alias ll="ls -hlA"
alias df="df -h"
# }}}

# Keybinds {{{
bind -x '"\C-j":"ll"'
bind '"\C-b": backward-word'
# }}}

# Prompt {{{
. "$XDG_CONFIG_HOME/bash/prompt" &> /dev/null
# }}}

# Integrations {{{
set -a
. "$XDG_CONFIG_HOME/integrations.sh" &> /dev/null
ANDROID_HOME="$XDG_DATA_HOME/android"
CARGO_HOME="$XDG_DATA_HOME/cargo"
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

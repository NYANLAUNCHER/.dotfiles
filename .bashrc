# Keybinds {{{
bind -x '"\C-j":"ll"'
bind '"\C-b": backward-word'
# }}}
# Prompt {{{
# default prompt
export PS1="\n\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$\[\033[0m\] "
# fancy prompt
source "$XDG_CONFIG_HOME/bash/prompt.sh" &> /dev/null
# }}}
# Integrations {{{


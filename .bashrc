source ~/.profile
# All the crap that is Bash specific and can't be put in .profile
shopt -s autocd
shopt -s direxpand
#set -o vi
# Keybinds {{{
bind -f ~/.inputrc
bind -x '"\C-j":"ll"'
#}}}
# Prompt {{{
# default prompt
export PS1="\n\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$\[\033[0m\] "
# fancy prompt
source "$XDG_CONFIG_HOME/bash/prompt.sh" &> /dev/null
#}}}
# Integrations {{{
# pnpm
export PNPM_HOME="/home/markiep/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

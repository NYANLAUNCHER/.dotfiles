#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

    parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
	if [[ ${EUID} == 0 ]] ; then
        PS1="\n\[\e[36m\][\t]\[\e[00m\]:\[\e[32m\][\h@\u]\[\e[00m\]:\[\e[35m\][\$parse_git_branch]\\n \[\e[33m\]\w> \[\e[00m\]"
	else
        PS1="\n\[\e[36m\][\t]\[\e[00m\]:\[\e[32m\][\h@\u]\[\e[00m\]:\[\e[35m\][\$parse_git_branch]\\n \[\e[33m\]\w> \[\e[00m\]"
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

#alias cp="cp -i"                          # confirm before overwriting something
#alias df='df -h'                          # human-readable sizes
#alias free='free -m'                      # show sizes in MB
#alias more=less

xhost +local:root > /dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# Auto Complete
source /usr/share/bash-completion/completions/git
source /usr/share/bash-completion/completions/gh

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ]; then
    ft=file $1
    case $1 in
      *.tar.bz2) tar xjf $1   ;;
      *.tar.gz)  tar xzf $1   ;;
      *.bz2)     bunzip2 $1   ;;
      *.rar)     unrar x $1   ;;
      *.gz)      gunzip $1    ;;
      *.tar)     tar xf $1    ;;
      *.tbz2)    tar xjf $1   ;;
      *.tgz)     tar xzf $1   ;;
      *.zip)     unzip $1     ;;
      *.Z)       uncompress $1;;
      *.7z)      7z x $1      ;;
      *)         echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/markiep/.local/share/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/markiep/.local/share/conda/etc/profile.d/conda.sh" ]; then
        . "/home/markiep/.local/share/conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/markiep/.local/share/conda/bin:$PATH"
    fi
fi
unset __conda_setup
conda deactivate
# <<< conda initialize <<<

# Set env vars
export EDITOR="nvim"
export INPUTRC="$HOME/.config/inputrc"
export GOPATH="$HOME/.local/share/go"
export PATH="$PATH:$HOME/.local/bin/:$GOPATH/bin:$HOME/.cargo/bin"

# Aliases
alias n="nvim"
alias pj="pjman"
alias rsc="rustc"
alias rsup="rustup"
alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias sudot="sudo git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias ncmp="ncmpcpp"
alias ardour="ardour7"
alias z="zathura"
alias so="
    if [ -z '$1' ];then
        source '$HOME/.bashrc'
    else
        source '$1'
    fi
"
alias xmodmap="
    if [ -z '$1' ];then
        xmodmap $HOME/.config/X11/xmodmap
    else
        xmodmap $1
    fi
"
alias virtman="virt-manager"
alias su="sudo su"
alias gitinfo="onefetch"
alias flameshot="
    if [ -z '$1' ];then
        flameshot launcher
    else
        flameshot '$1'
    fi
"
#for drawing directed graphs
alias dg="/usr/bin/dot"

todo="$HOME/notes/org/TODO.org"
alias todo="$EDITOR $todo"

# Env Vars
EDITOR=nvim
nl="
"

## Shortcuts
pics="$HOME/media/pics/"
vids="$HOME/media/vids/"
audio="$HOME/media/audio/"
music="$HOME/media/audio/music/"
dl="$HOME/tmp/downloads/"

pj="$HOME/proj/"
pjr="$HOME/proj/repos/"
pje="$HOME/proj/external/"
pjp="$HOME/proj/personal/"
pjt="$HOME/proj/template/"

fc="$HOME/files/FreeCAD/"
gd="$HOME/files/Godot_Engine/"
mc="$HOME/files/minecraft/"

nt="$HOME/notes/"
ntp="$HOME/notes/proj/"
nto="$HOME/notes/org/"
ntmc="$HOME/notes/mc/"

nv="$HOME/.config/nvim/"
nvp="$HOME/.config/nvim/plugconfig/"
nvc="$HOME/.config/nvim/plugin/"
nvd="$HOME/.local/share/nvim/"

. "$HOME/.cargo/env"

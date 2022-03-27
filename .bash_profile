#!/bin/sh

if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep awesome || startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -f ./xmodmap ]] && xmodmap ~/.config/X11/xmodmap

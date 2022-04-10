#!/bin/sh

if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep awesome || startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi

[[ -f "$HOME/.bashrc" ]] && . ~/.bashrc

[[ -f "$XDG_CONFIG_HOME/X11/xmodmap" ]] && xmodmap ~/.config/X11/xmodmap

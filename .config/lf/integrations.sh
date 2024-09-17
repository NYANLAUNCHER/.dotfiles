#!/bin/bash
# Integrate lf into the terminal

LFRC="$XDG_CONFIG_HOME/lf/lfrc"

lf-set-title() {
    printf "\033]0;$@\007" > /dev/tty
}

#export -f lf-set-title

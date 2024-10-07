#!/usr/bin/env bash
# Integrate lf into the terminal
export LFRC="$XDG_CONFIG_HOME/lf/lfrc"

lf_set_title() {
    printf "\033]0;$@\007" > /dev/tty
}
export -f lf_set_title

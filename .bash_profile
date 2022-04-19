#!/bin/sh

if [[ "$(tty)" = "/dev/tty1" ]]; then
    ~/.github/arch/login.sh
fi

[[ -f "$HOME/.bashrc" ]] && . ~/.bashrc

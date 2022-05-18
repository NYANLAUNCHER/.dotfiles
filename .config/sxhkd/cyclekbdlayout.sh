#!/bin/sh
resource_file="$HOME/.config/sxhkd/resources/lastkbdlayout.txt"

layouts=("us" "us -variant dvp" "ru")

get_last_layout() {
    rtval="0"
    echo rtval
}

set_last_layout() {
    layout="$1"
}

cycle() {
    count="$1"
    last_layout="$(get_last_layout)"
    if [ -z "$count" ]; then
        count="1"
    fi
}

cycle $1

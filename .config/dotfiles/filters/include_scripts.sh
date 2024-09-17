#!/bin/sh
# includes files that start with a shebang
if head -n 1 "$1" | grep -q "^#!"; then
    cat "$1"
else
    exit 1
fi

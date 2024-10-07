#!/bin/sh
# Sources all ~/.config/<prog>/integrations.sh
# to have a script ignored, just insert "exit 0" right after the shebang
find . -mindepth 2 -maxdepth 2 -name "integrations.sh" | while read -r script; do 
    echo "hi from $script"
    . "$script"
done

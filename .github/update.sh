#!/bin/bash
# update dotfiles
dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# update file owners & permisions
file_permisions () {
    owner="markiep"
    group="markiep"
    files=($($dot ls-tree -r master --name-only))
    sudo chown "$owner":"$group" ${files[@]}
}

# update submodules
submodules() {
    dot submodule foreach git checkout
}

# update tracked files
tracked_files() {
    echo "hello"
}

# run this after installing on a new machine
init() {
    file_permisions
    dot config --local status.showUntrackedFiles no
    submodules
}

case $1 in
    "init") init ;;
    "permissions") file_permisions ;;
    "submodules") submodules ;;
    *) echo "That is not a supported command."
esac

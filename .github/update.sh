#!/bin/bash
# update dotfiles
dot() {
    git --git-dir=$HOME/.dotfiles --work-tree=$HOME
}

# update file owners & permisions
file_permisions () {
    owner="markiep"
    group="markiep"
    files=($(dot ls-tree -r master --name-only))
    for ((i=0; i < ${#files[@]}; i++));do
        sudo chown "$owner":"$group" ${files[$i]}
    done
}

# update submodules
submodules() {
    dot submodule update --init --recursive
}

# update tracked files
tracked_files() {
    echo "hello"
}

# run this after running ./install.sh
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

#!/bin/sh
# A login prompt for the tty

# Set the defaults
user="markiep"
session="awesome"
xorg_sessions="/usr/share/xsessions/"
wayland_sessions="/usr/share/wayland-sessions/"
session_path="$xorg_sessions$session.desktop"

prompt () {
    echo "this is the prompt() function"
}

help () {
    echo "./login.sh [<option> <args>]"
    echo "<option> = [\"-h|\"help\"], [\"\"|\"-p\"|\"--prompt\"]"
    echo
    echo "-p <args> = [\"<user> <session>\"]"
    echo "  <user> = the user you want to login as"
    echo "  <session> = the session you want to login to"
}

case $1 in
    ""|"-p"|"--prompt") prompt ;;
    "-h"|"--help") help ;;
    *) echo -e "That is not a command.\nTry \"./login.sh help\"." ;;
esac

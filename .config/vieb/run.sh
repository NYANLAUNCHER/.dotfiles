#!/bin/sh
# Wrapper around vieb adds:
# --session="<path>" sets --datafolder=<dir>
# If <path> doesn't start with "./" or "/" it is a path in $VIEB_SESSIONS_DIR
# "-t"|"--temp" creates a temporary session 
. "$XDG_CONFIG_HOME/vieb/integrations.sh" # must be sourced

args="$*" # gets parsed into vieb compatible args
session_dir="$VIEB_DATAFOLDER" # the default session directory

# if --session exists
session="$(grep -oP '(?<=--session=)[^\s]+' | tail -n 1)" # input from --session
echo "session = '$session'"
if [ "${string#./}" != "$string" ] || [ "${string#/}" != "$string" ]; then
    session_dir="$session"
else
    [ -z "$VIEB_SESSIONS_DIR" ] && echo "Error: \$VIEB_SESSIONS_DIR must be set. Check $XDG_CONFIG_HOME/vieb/integrations.sh" && exit 1
    session_dir="$VIEB_SESSIONS_DIR/$session"
fi

# if "-t"|"--temp" exists
(echo "$args" | sed -E '/\b(-t|--temp)\b/!q1; s/\b(-t|--temp)\b/ /g') && temp_session="$(mktemp -d)"

args="$args --datafolder=\"${temp_session:-$session_dir}\""

# vieb uses the original vieb cmd since it is in a sh script
echo "vieb $args"
#eval "vieb $args"

[ -d "$temp_session" ] && rm -rf "$temp_session" # remove the temporary session once vieb is closed

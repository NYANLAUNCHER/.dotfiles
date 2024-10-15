#!/bin/sh
# set Vieb envvars, listed in the 'vieb --help' cmd
set -a
VIEB_CONFIG_FILE="$XDG_CONFIG_HOME/vieb/viebrc" # in current directory
VIEB_DATAFOLDER="$XDG_DATA_HOME/vieb" # the default session
VIEB_SESSIONS_DIR="$VIEB_DATAFOLDER/.sessions" # save named sessions, required by run.sh

VIEB_DEVTOOLS_THEME="dark"
VIEB_AUTOPLAY_MEDIA="user"
VIEB_ACCELERATION="hardware"

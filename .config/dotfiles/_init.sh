#!/bin/sh
[ -z "$DF_GIT_DIR" ] && echo "\$DF_GIT_DIR must be set" && exit 1
[ -z "$DF_WORK_TREE" ] && echo "\$DF_WORK_TREE must be set" && exit 1

rm -rf $DF_GIT_DIR/config $DF_GIT_DIR/info $DF_GIT_DIR/hooks $DF_GIT_DIR/filters 2>/dev/null

ln -s $(realpath $XDG_CONFIG_HOME/dotfiles/config) $DF_GIT_DIR/config
ln -s $(realpath $XDG_CONFIG_HOME/dotfiles/info) $DF_GIT_DIR/info
ln -s $(realpath $XDG_CONFIG_HOME/dotfiles/hooks) $DF_GIT_DIR/hooks
ln -s $(realpath $XDG_CONFIG_HOME/dotfiles/filters) $DF_GIT_DIR/filters

#!/bin/sh
[ -z "$DF_GIT_DIR" ] && echo "\$DF_GIT_DIR must be set" && exit 1
[ -z "$DF_WORK_TREE" ] && echo "\$DF_WORK_TREE must be set" && exit 1

rm -rf $DF_GIT_DIR/config $DF_GIT_DIR/info $DF_GIT_DIR/hooks $DF_GIT_DIR/filters 2>/dev/null

ln -s $(realpath $DF_WORK_TREE/.config/dotfiles/config) $DF_GIT_DIR/config
ln -s $(realpath $DF_WORK_TREE/.config/dotfiles/info) $DF_GIT_DIR/info
ln -s $(realpath $DF_WORK_TREE/.config/dotfiles/hooks) $DF_GIT_DIR/hooks
ln -s $(realpath $DF_WORK_TREE/.config/dotfiles/filters) $DF_GIT_DIR/filters

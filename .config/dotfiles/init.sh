#!/bin/sh
DF_GIT_DIR=${DF_GIT_DIR:-"../../.dotfiles"}
rm -rf $DF_GIT_DIR/config $DF_GIT_DIR/info $DF_GIT_DIR/hooks $DF_GIT_DIR/filters 2>/dev/null
ln -s $(realpath ./config) $DF_GIT_DIR/config
ln -s $(realpath ./info) $DF_GIT_DIR/info
ln -s $(realpath ./hooks) $DF_GIT_DIR/hooks
ln -s $(realpath ./filters) $DF_GIT_DIR/filters

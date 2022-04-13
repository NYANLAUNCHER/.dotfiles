#!/bin/bash
# My Arch install script

update_user_dirs () {
    source "$HOME/.config/user-dirs.dirs"
    mkdir -p $XDG_DOCUMENTS_DIR $XDG_DOWNLOAD_DIR $XDG_DESKTOP_DIR $XDG_PICTURES_DIR $XDG_VIDEOS_DIR $XDG_MUSIC_DIR $XDG_TEMPLATES_DIR $XDG_PUBLICSHARE_DIR
}

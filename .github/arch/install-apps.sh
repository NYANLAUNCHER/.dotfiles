#!/bin/bash
# Install apps|packages for Arch linux
## setup.sh handles the base packages

#"https://github.com/flightlessmango/MangoHud.git"
#"https://ardour.org/building_linux.html"
#"https://github.com/pystardust/ani-cli"
#"https://docs.anbox.io/userguide/install.html"

base () {
    pacman -S neovim awesome picom sxhkd kitty rofi xorg-xinit xorg-xset xorg-xev xorg-xmodmap \
            xorg-setxkbmap flameshot ufw qutebrowser zathura zathura-pdf-poppler tree ripgrep \
            sxiv glxinfo nvtop btop snapd yay
}

creation () {
    pacman -S obs-studio blender godot krita gimp 
}

dev () {
    pacman -S emacs clang boost boost-libs python-pip python
}

math () {
    pacman -S gnuplot libqalculate
}

games () {
    pacman -S pamac lutris wine winetricks
    pamac build minecraft-launcher
}

case $1 in
    "base") base ;;
    "dev") math ;;
    "math") math ;;
    "games") games ;;
    ""|"all") base; dev; math; games ;;
    *) 
    echo -e "That is not a supported command.\nUse:
    \"sudo ./install-apps.sh dev\",
    \"sudo ./install-apps.sh math\",
    \"sudo ./install-apps.sh games\""
esac

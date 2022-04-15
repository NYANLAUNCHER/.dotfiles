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
            sxiv htop btop nvtop glxinfo flatpak yay
}

dev () {
    pacman -S emacs clang boost boost-libs python-pip python
}

media () {
    pacman -S obs-studio blender godot krita gimp 
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
    "dev") dev ;;
    "media") media ;;
    "math") math ;;
    "games") games ;;
    ""|"all") base; dev; creation; math; games ;;
    *) 
    echo -e "That is not a supported command.\nUse:
    \"sudo ./install.sh base\",
    \"sudo ./install.sh dev\",
    \"sudo ./install.sh creation\",
    \"sudo ./install.sh math\",
    \"sudo ./install.sh games\""
esac

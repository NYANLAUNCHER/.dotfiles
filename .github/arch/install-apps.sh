#!/bin/bash
# Install apps|packages for Arch linux
## setup.sh handles the base packages

pacman -S neovim awesome picom sxhkd kitty rofi xorg-xinit xorg-xmodmap xorg-xev xorg-setxkbmap xorg-xset \
          qutebrowser wine winetricks godot glxinfo yay tree sxiv zathura zathura-pdf-poppler \
          nvtop ufw obs-studio blender krita gimp thunar python-pip python snapd flameshot btop 

dev () {
    pacman -S clang boost boost-libs ripgrep emacs
}

games () {
    pacman -S pamac lutris
    pamac build minecraft-launcher
}

math () {
    pacman -S gnuplot libqalculate
}

#"https://github.com/pystardust/ani-cli"
#"https://ardour.org/building_linux.html"
#"https://github.com/flightlessmango/MangoHud.git"
#"https://docs.anbox.io/userguide/install.html"
#"https://github.com/andreafrancia/trash-cli"

case $1 in
    "dev") math ;;
    "math") math ;;
    "games") games ;;
    ""|"all") dev; math; games ;;
    *) echo -e "That is not a supported command.\nUse:
        \n\t\"./install-apps.sh dev\"
        \n\t\"math\"
        \n\t\"games\""
esac

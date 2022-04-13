#!/bin/bash
# Install apps|packages for Arch linux
## setup.sh handles the base packages

pacman -S neovim awesome xorg-xinit xorg-xmodmap xorg-xev xorg-setxkbmap xorg-xset rofi ripgrep zathura zathura-pdf-poppler \
          picom boost boost-libs clang qutebrowser sl pamac lutris wine winetricks godot glxinfo yay emacs tree sxiv \
          nvtop ufw trash-cli obs-studio sxhkd kitty blender krita gimp thunar python-pip python virtualbox snapd flameshot btop

pamac build minecraft-launcher

#"https://github.com/pystardust/ani-cli"
#"https://ardour.org/building_linux.html"
#"https://github.com/flightlessmango/MangoHud.git"
#"https://docs.anbox.io/userguide/install.html"
#"https://github.com/andreafrancia/trash-cli"

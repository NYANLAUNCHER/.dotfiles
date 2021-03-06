#!/bin/bash
# Install apps|packages for Arch linux

#"https://github.com/flightlessmango/MangoHud.git"
#"https://ardour.org/building_linux.html"
#"https://github.com/pystardust/ani-cli"
#"https://docs.anbox.io/userguide/install.html"

# make sure paru is installed before using it
paru() {
    if [ ! command -v paru &> /dev/null ];then
        echo "paru could not be found"
        exit
    elif;then
    pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ..
    echo -e "run this:\n\t\"rm -r paru\""
    fi
}

base() {
    pacman -S \
      neovim awesome picom git sxhkd kitty rofi xorg-xinit xorg-xset xorg-xev xorg-xmodmap \
      xorg-setxkbmap flameshot ufw qutebrowser tree ripgrep curl mpv htop btop nvtop \
      glxinfo zathura zathura-pdf-poppler pandoc paru element lua-language-server flatpak
    paru openrazer-git polychromatic nsxiv f3d
    gpasswd -a "$USER" plugdev
}

dev() {
    pacman -S \
      clang boost boost-libs python python-pip iverilog ghdl rustup gunzip \
      dmd rdmd dub gopls xxd lua-language-server deno docker ventoy qemu valgrind
    paru valkyrie vscode-langservers-extracted jdtls miniconda
    rustup update
    rustup component add rls rust-analysis rust-src
    curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > $HOME/.cargo/bin/rust-analyzer
    chmod +x $HOME/.cargo/bin/rust-analyzer
}

creation() {
    pacman -S obs-studio blender godot krita gimp inkscape freecad 
}

math() {
    pacman -S gnuplot libqalculate texlive-most
}

games() {
    pacman -S lutris wine winetricks steam steamcmd
    paru minecraft-launcher
    echo "Before installing \"steam, steamcmd\", make sure the [multilib] section in /etc/pacman.conf is uncommented."
    echo -e "The instructions can be found here, \033[34m\"https://wiki.archlinux.org/title/Official_repositories#multilib\"\033[0m."
    read -p "hit enter to continue: "
    pacman -S steam seamcmd
}

case $1 in
    "base") base ;;
    "dev") dev ;;
    "creation") creation ;;
    "math") math ;;
    "games") games ;;
    ""|"all") base; dev; creation; math; games ;;
    *)
    echo -e "That is not a supported command.
    Use:
    \"sudo ./install.sh base\",
    \"sudo ./install.sh dev\",
    \"sudo ./install.sh creation\",
    \"sudo ./install.sh math\",
    \"sudo ./install.sh games\"" ;;
esac

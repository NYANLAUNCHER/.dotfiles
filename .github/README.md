
# Dot Files

This repo stores my dotfiles as well as any other scripts for setting up a new machine.

## Install

Clone this repo into the home dir
```sh
cd ~
git clone https://github.com/NYANLAUNCHER/dotfiles.git .dotfiles
```
Add this line to your ~/.bashrc.
```sh
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
Use this if you don't want to see unnecessary files and dirs.
```sh
dot config --local status.showUntrackedFiles no
```

Lastly, any distro specific configs and setup will be in the appropriately named dir (~/.github/distro_name).

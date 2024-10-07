# Dotfiles
This is a mono-repo for my dotfiles

## Cloning
```sh
cd
git clone --bare "git@github.com:NYANLAUNCHER/.dotfiles" .dotfiles
git --work-tree="$HOME" --git-dir="$HOME/.dotfiles" checkout
# `alias dot="git --work-tree=$DF_ --git-dir=$HOME/.dotfiles"` is set in .profile
```

## Using sparse-checkout
```sh
dot 
```

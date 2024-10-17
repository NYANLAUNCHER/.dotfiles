# Dotfiles
This is a mono-repo for my dotfiles

## Cloning
```sh
cd
git clone --bare "git@github.com:NYANLAUNCHER/.dotfiles" .dotfiles
git --work-tree="$HOME" --git-dir="$HOME/.dotfiles" checkout
# `alias dot="git --work-tree=$DF_WORK_TREE/ --git-dir=$DF_GIT_DIR"` is set in .profile
```

## Using sparse-checkout
```sh
cd
dot sparse-checkout set README.md
```

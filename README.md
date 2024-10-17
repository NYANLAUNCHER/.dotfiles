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
dot sparse-checkout reapply
```

## Notes
```sh
# all my shell scripts assume these are set:
# XDG Base dirs
export XDG_CONFIG_HOME="..."
export XDG_CACHE_HOME="..."
export XDG_DATA_HOME="..."
export XDG_STATE_HOME="..."
# dotfiles
export DF_WORK_TREE="..."
export DF_GIT_DIR="..."
# default programs
export EDITOR="nvim"
# just make sure that .profile is sourced
```

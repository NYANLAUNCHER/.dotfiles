# Dotfiles
This is a mono-repo for my dotfiles

## Cloning
```sh
cd
git clone --bare "git@github.com:NYANLAUNCHER/.dotfiles" .dotfiles
git --work-tree=./ --git-dir=.dotfiles/ checkout
. .profile && dot_init # defined in .profile
# Enable sparse-checkout (optional)
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

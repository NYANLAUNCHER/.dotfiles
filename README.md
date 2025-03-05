# Dotfiles
This is a mono-repo for my dotfiles

## Cloning
```sh
cd
git clone --bare "git@github.com:NYANLAUNCHER/.dotfiles" .dotfiles
git --work-tree=./ --git-dir=.dotfiles/ checkout -f
. .profile && dot-configure
# disable sparse-checkout (optional)
dot sparse-checkout disable
```

## Notes
```sh
# All my shell scripts assume `~/.profile` is a file,
# and that these environment variables are set in .profile:
# XDG Base dirs
export XDG_CONFIG_HOME="..."
export XDG_CACHE_HOME="..."
export XDG_DATA_HOME="..."
export XDG_STATE_HOME="..."
# dotfiles
export DF_WORK_TREE="..."
export DF_GIT_DIR="..."
# default programs
export EDITOR="..."

# all paths: "$XDG_CONFIG_HOME/<prog>/integrations.sh" are sourced; where <prog> is a single (sub)dir
# "$XDG_CONFIG_HOME/<prog>/run.sh" gets aliased as <prog>
```

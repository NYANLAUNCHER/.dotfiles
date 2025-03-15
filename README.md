# Dotfiles
This is a mono-repo for my dotfiles

## Cloning
```sh
cd ~
git clone --bare "git@github.com:NYANLAUNCHER/.dotfiles" .dotfiles
git --work-tree=./ --git-dir=.dotfiles/ checkout -f
. .profile && dot-configure
# disable sparse-checkout (optional)
dot sparse-checkout disable
```

## Updating User Directories
```sh
rm -rf ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Public ~/Templates ~/Videos > /dev/null 2>&1
mkdir -p ~/tmp/.torrent ~/tmp/.iso
# setup syncthing
cd && ln -s files/.notes notes
```

## Notes
```sh
# All my shell scripts assume `~/.profile` exists as a file,
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
export OPENER="..."

# all file paths matching "$XDG_CONFIG_HOME/**/init.sh" are sourced by ~/.profile
# place any other shell scripts in "$XDG_CONFIG_HOME/**/shell"

# Other Considerations:
# - use $DF_WORK_TREE over $HOME for sourcing other dotfile scripts
```

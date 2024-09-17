# Using git sparse-checkout
```sh
cd
git clone --bare "git@github.com:NYANLAUNCHER/.dotfiles.git" .dotfiles
git --git-dir=.dotfiles --work-tree=. sparse-checkout set <paths_to_checkout>
git --git-dir=.dotfiles --work-tree=. pull origin main
```

# Home

## Prequisite

* [git](https://git-scm.com/)
* [home-manager](https://nix-community.github.io/home-manager/)

## Setup

```sh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> .gitignore
git clone --bare git@github.com:scythx/home.git $HOME/.dotfiles

# Checkout the actual content from the bare repository to your $HOME
# Note that you have to back up every conflicting files
dotfiles checkout
```

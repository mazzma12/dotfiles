# Dotfiles
Host config files for UNIX machines. The versioning system uses a git bare repository system as recommended in  
[Atlassian and Hacker News](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

## Init dotfiles repository
Only do it once -follow the article...

## Setup new machine
 
### Requirements

Main requirements includes : `git curl zsh zsh-completions vim neovim`

#### Alpine

```bash
apk add --update --no-cache git vim neovim curl 
```
Or see the Dockerfile at the root of this repository

#### Ubuntu 

```bash
sudo apt-get install zsh zsh-completions && \
		vim-gtk # For paste-bin support

# Also add oh-my-zsh before to not have conflict
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Install repo

Auto install 
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/mazzma12/dotfiles/master/install.sh)"
```

Or DIY as in the article :
```bash
# clone the repo
git clone --bare git@github.com:mazzma12/dotfiles.git $HOME/.cfg
# add to zshrc or bashrc
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# add to gitignore
echo ".cfg" >> .gitignore
config checkout .
config config --local status.showUntrackedFiles no
```

## Optional 

```bash
# Filter to clean jupyter notebook metadata
sudo apt install jq

# Latest tmux follow: https://gist.github.com/P7h/91e14096374075f5316e
sudo apt-get install tmux-next=2.3~20161117~bzr3621+20-1ubuntu1~ppa0~ubuntu14.04.1	# get this from https://launchpad.net/~pi-rho/+archive/ubuntu/dev
```

## First setup

As in the article
```bash
git init --bare $HOME/.cfg
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
source /.zshrc
config config --local status.showUntrackedFiles no
# or add this to .zshrc
```

Then to add stuff, we can do:
```bash
config add .zshrc
config commit -m 'Add zsh config'
config remote set-url origin git@github.com:mazzma12/dotfiles.git
config push
```

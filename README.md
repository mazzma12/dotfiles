# Dotfiles
Host config files for UNIX machines. The versioning system uses a git bare repository system as recommended in  
[Atlassian and Hacker News](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

| branch | description |
| ------ | ----------- |
| master or *ubuntu* | For ubuntu 20.04 | 
| manjaro | For Arch based distro | 
| pi | For raspberry pi *outdated* |
| xless | For server config *outdated* | 

## Setup new machine

Either use the installation script or a manual install as explained in the article. Note that the manual installation will conflict with existing dotfiles in your working space. The `install.sh` script  will back up conflicting files : `.zshrc` > `.zshrc.bak`

**Recommended requirements:** `git curl zsh zsh-completions vim`

### Manual install

```bash
# clone the repo
git clone --bare https://github.com/mazzma12/dotfiles.git $HOME/.cfg
# add to zshrc or bashrc
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# add to gitignore
echo ".cfg" >> .gitignore
config checkout .
config config --local status.showUntrackedFiles no
```
### Auto Install

Auto install script from a specific branch. This will backup original config files if conflicts (suffix to `.bak`)  and checkout the bare repository.
It comes along with `uninstall.sh` to restore all config and delete the local bare repository.

```bash
export DOTFILES_BRANCH="master" # Default branch to clone from
export DOTFILES_HOME="$HOME/.cfg" # Default install directory
sh -c "$(curl -fsSL https://raw.githubusercontent.com/mazzma12/dotfiles/master/install.sh)"
```

## Troubleshooting 

```bash
# Latest tmux follow: https://gist.github.com/P7h/91e14096374075f5316e
sudo apt-get install tmux-next=2.3~20161117~bzr3621+20-1ubuntu1~ppa0~ubuntu14.04.1	# get this from https://launchpad.net/~pi-rho/+archive/ubuntu/dev
```

## Create the dotfiles repository

As in the article mentioned above:
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

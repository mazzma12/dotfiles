# dotfiles
Host dotfiles / config files for my UNIX machine. Modified from 
[Atlassian and Hacker News](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/) to
work with submodules in github (Oh My Zsh, vim plugins, ..)

Initial setup:
```
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
# or add this to .zshrc
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

Then to add stuff, we can do:
```
config add .zshrc
config commit -m 'added zshrc'
config remote set-url origin git@github.com:mazzma12/dotfiles.git
config push
```

On a new computer:
```
# locally
ssh-copy-id user@host
# install zsh and other things
sudo apt-get install zsh autojump keychain
# brew install zsh-syntax-highlighting
# set git variables
git config --global user.email blah
git config --global user.name "mazzma12"
# generate a new key, add `cat ~/.ssh/id_rsa.pub` to https://github.com/settings/ssh and https://bitbucket.org/account/user/thejaan/ssh-keys/
ssh-keygen -t rsa -b 4096 -C "your_email@example"
# make zsh default, install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# may need to logout
exit
# locally
ssh -O exit user@host
# login again; shell should change
# clone the repo
git clone --bare git@github.com:mazzma12/dotfiles.git $HOME/.cfg
# add to zshrc or bashrc
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# add to gitignore
echo ".cfg" >> .gitignore
config checkout .
config config --local status.showUntrackedFiles no
# IMPORTANT: this pulls the latest plugins we are using, see below
config submodule update --init
source ~/.zshrc
# update & upgrade
sudo apt-get update
sudo apt-get upgrade
# install latest tmux
lsb_release -a  # then follow: https://gist.github.com/P7h/91e14096374075f5316e
sudo apt-get install tmux-next=2.3~20161117~bzr3621+20-1ubuntu1~ppa0~ubuntu14.04.1	# get this from https://launchpad.net/~pi-rho/+archive/ubuntu/dev
sudo locale-gen "en_US.UTF-8"
```

In vim, install plugins with vundle:
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
Then open vim, and type `:BundleInstall`.


### Managing plugins with pathogen and tmux plugin manager
To install a plugin, we need to tell git that it is a submodule. Adding a folder recursively that contains git repositories (submodules) will not work. After adding all submodules/plugins we need, we can pull them all at once. The dotfiles repo then needs to be cloned with the `--recursive` option, or we can run `git submodule update --init` as above.
```
cd ~/.vim/bundle
config submodule add https://github.com/tpope/vim-repeat
config submodule foreach git pull
```

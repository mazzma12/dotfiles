# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes --user install if folder exists 
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Preferred editor 
if which nvim >/dev/null 2>&1; then
  export EDITOR='nvim'
  alias vi='nvim'
else
  export EDITOR='vi' 
fi

if [ -n "$DISPLAY" ]; then
	# Keyboard conf
	setxkbmap us -variant altgr-intl
	# Change cap lock to Esc
	xmodmap $HOME/.Xmodmap
fi

export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ] ; then
    PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi


# https://broken-by.me/lazy-load-nvm/
nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm "$@"
}

node() {
    unset -f node
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    node "$@"
}

npm() {
    unset -f npm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    npm "$@"
}

# https://mywiki.wooledge.org/DotFiles
if [ -n "$BASH" ] && [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi


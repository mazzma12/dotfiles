export ZSH=$HOME/.oh-my-zsh  # Update to use with oh my zsh

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git k docker zsh-docker-aliases z)

source $ZSH/oh-my-zsh.sh
source $(which virtualenvwrapper.sh)

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]; then
  source ~/.localrc
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim' # Setting nano default
fi
# https://unix.stackexchange.com/a/113768/268905
# TMUX
if which tmux >/dev/null 2>&1; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi

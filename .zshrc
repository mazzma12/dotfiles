export ZSH=$HOME/.oh-my-zsh  

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# TMUX
# https://unix.stackexchange.com/a/113768/268905
if which tmux >/dev/null 2>&1; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux
fi

# Preferred editor 
if which nvim >/dev/null 2>&1; then
  export EDITOR='nvim'
  alias vi='nvim'
else
  export EDITOR='vi' 
fi
if [[ -f $ZSH/oh-my-zsh.sh ]]; then
  source $ZSH/oh-my-zsh.sh
fi
if [[ -f $(which virtualenvwrapper.sh) ]]; then
  source $(which virtualenvwrapper.sh)
fi

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]; then
  source ~/.localrc
fi


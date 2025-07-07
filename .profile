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
  # For lazy loading
  alias vi='nvm > /dev/null && nvim'
else
  export EDITOR='vi'
fi

if [ -n "$DISPLAY" ]; then
	# Keyboard conf
	setxkbmap us -variant altgr-intl
	# Change cap lock to Esc
	xmodmap $HOME/.Xmodmap
fi

# https://mywiki.wooledge.org/DotFiles
if [ -n "$BASH" ] && [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi
export GPG_TTY=$(tty)

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 2>/dev/null ) )
}
complete -o default -F _pip_completion $HOME/.pyenv/versions/neovim/bin/python -m pip
# pip bash completion end
if [ -f "$HOME/.local/bin" ] ; then
  source ~/.dbt-completion.bash
fi

[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

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
fi

if which virtualenvwrapper.sh>/dev/null 2>&1; then
	source $(which virtualenvwrapper.sh)
fi

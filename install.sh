#!/bin/sh
main(){
	set -e;
	export DOTFILES_HOME="$HOME/.cfg"

	if [ -d $DOTFILES_HOME ]; then
		printf "Dotfiles already installed.\n"
	fi
	
	if [ -f $HOME/.zshrc ]; then
		printf "Moving old zsh config to .zshrc.bak.\n"
		mv $HOME/.zshrc $HOME/.zshrc.bak
	fi

	if [ -f $HOME/.profile ]; then
		printf "Moving old profile config to .profile.bak\n"
		mv $HOME/.profile $HOME/.profile.bak
	fi

	git clone --bare https://github.com/mazzma12/dotfiles.git $DOTFILES_HOME && \
	/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout -- && \
	/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no;


	if which nvim >/dev/null 2>&1; then
		nvim +slient +VimEnter +PlugInstall +qall > /dev/null 
	fi

	if which vim >/dev/null 2>&1; then
		vim +slient +VimEnter +PlugInstall +qall > /dev/null 
	fi
}
main




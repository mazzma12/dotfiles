#!/bin/sh
main(){
	set -e;
	export DOTFILES_HOME="$HOME/.cfg"

	if [ -d $DOTFILES_HOME ]; then
		printf "Dotfiles already installed.\n"
		exit
	fi

	git clone --bare https://github.com/mazzma12/dotfiles.git $DOTFILES_HOME && \
	/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout -- ;
	nvim +slient +VimEnter +PlugInstall +qall > /dev/null 

}
main




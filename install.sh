#!/bin/sh
main(){
	set -e;
	export DOTFILES_HOME="$HOME/.cfg"
	export branch=${1:-master}
	echo "Cloning from branch: $branch"

	if [ -d $DOTFILES_HOME ]; then
		printf "Dotfiles already installed.\n"
	fi
	
	git clone --bare https://github.com/mazzma12/dotfiles.git --branch $branch $DOTFILES_HOME 

	function config {
		/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
	}
	if  config checkout ; then
		echo "Checked out config.";
	else
		echo "Backing up pre-existing dot files to with .bak suffixes";
		config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv -i {} {}.bak
	fi;
	config checkout
	config config status.showUntrackedFiles no

	if which nvim >/dev/null 2>&1; then
		nvim +slient +VimEnter +PlugInstall +qall > /dev/null 
	fi

	if which vim >/dev/null 2>&1; then
		vim +slient +VimEnter +PlugInstall +qall > /dev/null 
	fi
}
main




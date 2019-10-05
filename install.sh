#!/bin/bash

set -ex
export dotfiles_home=${DOTFILES_HOME:-$HOME/.cfg}
export branch=${DOTFILES_BRANCH:-master}
config() {
	/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

main() {
	echo "Cloning from branch: $branch"

	if [ -d $dotfiles_home ]; then
		printf "Dotfiles already installed.\n"
	fi
	
	git clone --bare https://github.com/mazzma12/dotfiles.git --branch $branch $dotfiles_home 

	if config checkout; then
		echo "Checked out config without conflicts.";
	else
		echo "Conflict with existing dotfiles. Backing up with .bak suffixes";
		# Grab conflicting filenames and move them to {}.bak
		config checkout 2>&1 | egrep "\s+\*" | awk {'print $1'} | xargs -I{} mv -v $HOME/{} $HOME/{}.bak
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




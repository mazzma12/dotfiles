#!/bin/sh
main(){
	set -e;
	export DOTFILES_HOME="$HOME/.cfg"
	export branch=${1:-master}
	function config {
		/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
	}
	config ls-tree --full-tree -r --name-only HEAD | xargs -I{} sh -c "rm {}; echo Removing dotfile {}; \
		if [ -f {}.bak ]; then mv {}.bak {}; fi"
	rm -Ir $DOTFILES_HOME
}
main




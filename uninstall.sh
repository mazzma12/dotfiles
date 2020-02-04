#!/bin/sh
main(){
	set -e;
	export DOTFILES_HOME="$HOME/.cfg"
	export branch=${1:-master}
	function config {
		/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
	}
	echo "Removing dotfiles...."
	config ls-tree --full-tree -r --name-only HEAD | xargs -I{} sh -c "rm -v {}; \
		if [ -f {}.bak ]; then mv -v {}.bak {}; fi"
	rm -Ir $DOTFILES_HOME
}
main




FROM alpine:3.7

ENV MAIN_PKGS "git vim neovim curl"

RUN apk update; \
    apk --update --no-cache add ${MAIN_PKGS} && \
		git clone --bare https://github.com/mazzma12/dotfiles.git $HOME/.cfg && \
		/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout -- && \
		nvim +slient +VimEnter +PlugInstall +qall > /dev/null 

ENTRYPOINT /bin/sh

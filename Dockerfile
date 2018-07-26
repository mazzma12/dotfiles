FROM alpine:3.7

ENV MAIN_PKGS "git vim curl"

WORKDIR $HOME/.cfg
RUN apk update; \
    apk --update --no-cache add ${MAIN_PKGS}
RUN git clone --bare https://github.com/mazzma12/dotfiles.git $HOME/.cfg

# RUN alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' && \
RUN /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout --
# RUN /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME submodule update --init
RUN vim +slient +VimEnter +PlugInstall +qall > /dev/null
ENTRYPOINT /bin/sh

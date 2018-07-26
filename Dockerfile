FROM alpine:3.7

ENV MAIN_PKGS "git vim neovim curl"

RUN apk update; \
    apk --update --no-cache add ${MAIN_PKGS} && \
		/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/mazzma12/dotfiles/master/install.sh)"
ENTRYPOINT /bin/sh

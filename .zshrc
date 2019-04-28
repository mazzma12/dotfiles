#zmodload zsh/zprof # top of your .zshrc file
# ZPlug
if [[ ! -d ~/.zplug ]]; then
		# Check if zplug is installed
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/z",   from:oh-my-zsh
zplug "plugins/docker",   from:oh-my-zsh
zplug "plugins/docker-compose",   from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/git", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/termsupport", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "supercrabtree/k", as:plugin
zplug "akarzim/zsh-docker-aliases", as:plugin
zplug "olivierverdier/zsh-git-prompt", as:plugin, use:"zshrc.sh"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "mafredri/zsh-async", from:github
#zplug "dfurnes/purer", use:pure.zsh, from:github, as:theme
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
export PURE_GIT_PULL=0
zplug load 

# Lines configured by zsh-newuser-install
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=2000
export SAVEHIST=$HISTSIZE
setopt appendhistory autocd extendedglob
unsetopt beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

# Fix slow init Source https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2308206
setopt EXTENDEDGLOB
for dump in $HOME/.zcompdump(#qN.m1); do
	compinit
	if [[ -s "$dump" && (! -s "$dump.zwc" || "$dump" -nt "$dump.zwc") ]]; then
		zcompile "$dump"
	fi
done
unsetopt EXTENDEDGLOB
compinit -C
# End of lines added by compinstall

unsetopt menu_complete
unsetopt flow_control
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt inc_append_history
setopt share_history

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:*:*:processes' command "ps -o pid,user,comm -w -w"

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# Bindkey differs on Arch / Ubuntu https://unix.stackexchange.com/q/465266/268905
bindkey '^[[A' up-line-or-beginning-search
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search

#PROMPT='%F{blue}%n%f%F{white}@%f%F{blue}%M%f %(?:%F{green}➜%f :%F{red}➜%f )%F{cyan}%~%f$(git_super_status)'

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]; then
  source ~/.localrc
fi

if [ "$COLORTERM" = "gnome-terminal" ] || [ "$COLORTERM" = "xfce4-terminal" ]
then
    export TERM=xterm-256color
elif [ "$COLORTERM" = "rxvt-xpm" ]
then
    export TERM=rxvt-256color
fi

# TMUX
# https://unix.stackexchange.com/a/113768/268905
if which tmux >/dev/null 2>&1; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux
fi
#zprof # bottom of .zshrc

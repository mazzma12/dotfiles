# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# Config 
export EDITOR='vi'
alias zshconfig="$EDITOR ~/.zshrc"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ae="$EDITOR $ZSH_CUSTOM/aliases.zsh"
alias ve="$EDITOR $HOME/.vimrc"

# System
alias rm=trash
alias ls='ls -hG --color=auto'
alias lt='ls -ahlHt --color=auto'
alias ll='ls -alhG --color=auto'
alias lt='ls -t --color=auto'
alias mvdl='ls -td -1 $HOME/Downloads/* | head -n 1 | xargs -I {} mv {} .'
alias my_ip="ip route get 8.8.8.8"
alias reload!="source ~/.zshrc"
alias psa="ps aux"
alias -g C='| wc -l'
alias -g H='| head'
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S='| sort'
alias -g G='| grep' # now you can do: ls foo G something
alias -g X='| xclip -sel c' # Pipe to clipboard
alias o="xdg-open"
# Use vim to display man 
vman() { /usr/bin/man $* | col -b | vim -c 'set ft=man nomod nolist' -c 'nmap q :q<CR>' -; }
alias man='vman'

# Python
alias jn='jupyter notebook --NotebookApp.iopub_data_rate_limit=2147483647 --NotebookApp.iopub_msg_rate_limit=2147483647'
alias sparkconfig="sudo nano /opt/spark/conf/spark-env.sh"
alias watch_nvidia='watch -d -n 1 nvidia-smi'
alias clean_ipynb="jq --indent 1 \
    '(.cells[] | select(has(\"outputs\")) | .outputs) = []  \
    | (.cells[] | select(has(\"execution_count\")) | .execution_count) = null  \
    | .metadata = {\"language_info\": {\"name\": \"python\", \"pygments_lexer\": \"ipython3\"}} \
    | .cells[].metadata = {} \
    '"
# Docker
alias db="docker build"
alias dr="docker run"

# Git 
alias gpom="git pull origin master"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD' # Push branch with same name as local
# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
alias gac='git add -A && git commit -m'

# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
# Interesting but need to hqve Go dev environment. Later
#hub_path=$(which hub)
#if (( $+commands[hub] ))
#then
#  alias git=$hub_path
#fi

# Misc
alias doumage="echo '¯\\_(ツ)_/¯'"

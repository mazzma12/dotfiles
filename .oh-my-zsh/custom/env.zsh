# Dev Env
export WORKON_HOME=~/Envs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export LOGS_PATH=$HOME/logs/
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
xmodmap -e "clear lock"
xmodmap -e "keycode 66 = Escape NoSymbol Escape"

# ML
export CUDA_HOME=/usr/local/cuda-8.1
export PATH=$CUDA_HOME/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=$CUDA_HOME/lib64
export DYLD_LIBRARY_PATH="$CUDA_HOME/lib64:$CUDA_HOME:$CUDA_HOME/extras/CUPTI/lib64"
export SPARK_HOME=/opt/spark
export GRADLE_HOME=/opt/gradle
export PATH=/opt:$SPARK_HOME/bin:$GRADLE_HOME/bin:$PATH

# System
export ZSH_CUSTOM="$ZSH/custom"
export HISTSIZE=100000           # Lots of history.
export HISTFILESIZE=100000       # Lots of history in the file.
export HISTCONTROL=ignoreboth    # Ignore entries with leading white space and dupes.
export HISTIGNORE="ls:ll:cd:fg:j:jobs"   # Uninteresting commands to not record in history.
export N_PROC="$(grep -c processor /proc/cpuinfo)"

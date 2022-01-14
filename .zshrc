set -o vi
export LC_ALL=en_US.UTF-8
export VISUAL=nvim
export BROWSER="firefox %s"
export TERM="xterm-256color"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

### PYTHON ###
export PIP_CONFIG_FILE=~/.pip/pip.conf
# venv
alias venv2='virtualenv -p `which python2.7` py2'
alias venv3='virtualenv -p `which python3` py3'
alias svenv2='source py2/bin/activate'
alias svenv3='source py3/bin/activate'
##############

# Add homebrew to zsh path
export PATH=/usr/local/bin:$PATH


#ssh
[ -r ~/.ssh/env ] && .  ~/.ssh/env 
    kill -0 "$SSH_AGENT_PID" || {
    # It's dead so let's create a new one:
    eval `ssh-agent`
    printenv | egrep "^(SSH_AGENT_PID|SSH_AUTH_SOCK)=" > ~/.ssh/env
    echo 'export SSH_AGENT_PID SSH_AUTH_SOCK' >> ~/.ssh/env
    }
ssh-add ~/.ssh/id_rsa


#git alias
alias g='git'

# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g

#tmux alias
alias cl='clear; tmux clear-history; clear'

#neovim alias
alias vi='nvim'

# ls
alias l='ls -larth'

# SBT
alias sbt11='sbt -java-home /Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home'
alias sbt8='sbt -java-home /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home'

eval "$(direnv hook zsh)"

########################### Env conf

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# User
DEFAULT_USER=elyasib

ZSH_THEME="agnoster"

plugins=(git tmux scala sbt pip macos git-extras vi-mode wd brew docker)

source $ZSH/oh-my-zsh.sh

eval "$(pyenv init -)"

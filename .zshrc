# Add homebrew to zsh path
export PATH=/usr/local/bin:$PATH

#default java version
#export JAVA_HOME=`/usr/libexec/java_home -v 1.7.0_79`
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_92`
export ANT_OPTS="-Xmx960m -XX:MaxPermSize=784m"

#Production
function cdh5Prod
{
	local CLEAN_PATH=`/usr/bin/ruby -e 'print ENV["PATH"].split(":").reject{|p| p=~/(hadoop|hive|sqoop)_distros/ }.uniq.join(":")'`
	export HADOOP_HOME=$HDFS_BASE_DIR/vendor/hadoop_distros/current
	export HADOOP_CONF_DIR=$HDFS_BASE_DIR/vendor/hadoop_distros/current/etc/hadoop
	export HIVE_HOME=$HDFS_BASE_DIR/vendor/hive_distros/current
	export HIVE_CONF_DIR=$HIVE_HOME/conf
	export SQOOP_HOME=$HDFS_BASE_DIR/vendor/sqoop_distros/current
	export PATH=$HADOOP_HOME/bin:$HIVE_HOME/bin:$SQOOP_HOME/bin:$CLEAN_PATH
	export SPARK_HOME="/Users/isantiago/spark/spark-1.6.3-bin-hadoop2.3"
}

#Staging
function cdh5S
{
  local CLEAN_PATH=`/usr/bin/ruby -e 'print ENV["PATH"].split(":").reject{|p| p=~/(hadoop|hive|sqoop|spark)_distros/ }.uniq.join(":")'`
	export HADOOP_HOME=$HDFS_BASE_DIR/vendor/hadoop_distros/current
	export HADOOP_CONF_DIR=$HDFS_BASE_DIR/vendor/hadoop_distros/current/conf-cdh5-staging
	export HIVE_HOME=$HDFS_BASE_DIR/vendor/hive_distros/apache-hive-0.14.0-bin
	export HIVE_CONF_DIR=$HIVE_HOME/conf-staging
	export SQOOP_HOME=$HDFS_BASE_DIR/vendor/sqoop_distros/current
	export SPARK_HOME="/Users/isantiago/spark/spark-1.6.3-bin-hadoop2.3"
	export PATH=$CLEAN_PATH:$HADOOP_HOME/bin:$HIVE_HOME/bin:$SQOOP_HOME/bin:$SPARK_HOME/bin
}

#Next-staging
function cdh5NS
{
	local CLEAN_PATH=`/usr/bin/ruby -e 'print ENV["PATH"].split(":").reject{|p| p=~/(hadoop|hive|sqoop|spark)_distros/ }.uniq.join(":")'`
	export HADOOP_HOME=$HDFS_BASE_DIR/vendor/hadoop_distros/current
	export HADOOP_CONF_DIR=$HDFS_BASE_DIR/vendor/hadoop_distros/current/conf-cdh5-next-staging
  export HIVE_HOME=$HDFS_BASE_DIR/hive_distros/current
  export HIVE_CONF_DIR=$HIVE_HOME/conf-next-staging
	export SQOOP_HOME=$HDFS_BASE_DIR/vendor/sqoop_distros/current
	export SPARK_HOME="/Users/isantiago/spark/spark-1.6.3-bin-hadoop2.3"
	export PATH=$CLEAN_PATH:$HADOOP_HOME/bin:$HIVE_HOME/bin:$SQOOP_HOME/bin:$SPARK_HOME/bin
}

#ssh
[ -r ~/.ssh/env ] && .  ~/.ssh/env 
    kill -0 "$SSH_AGENT_PID" || {
    # It's dead so let's create a new one:
    eval `ssh-agent`
    printenv | egrep "^(SSH_AGENT_PID|SSH_AUTH_SOCK)=" > ~/.ssh/env
    echo 'export SSH_AGENT_PID SSH_AUTH_SOCK' >> ~/.ssh/env
    }
ssh-add ~/.ssh/id_rsa


#rbenv
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#git alias
alias g='git'

# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g

#tmux alias
alias cl='clear && tmux clear-history'

#hdfs alias
alias hls='hdfs dfs -ls'
alias dfs='hdfs dfs'

#json alias
alias pygj='json | pygmentize -l json'

#neovim alias
alias vi='nvim'

# ls
alias l='ls -larth'

########################### Env conf


# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# User
DEFAULT_USER=elyasib

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git tmux scala sbt pip osx mvn jsontools jira git-extras encode64 vi-mode wd brew)
# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

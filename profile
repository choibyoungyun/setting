# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

########################################################
# PS
########################################################
export PS1='[\h:\u \W]\$ '

########################################################
# Default (vim8)
########################################################
set -o vi

########################################################
# nvm (node manager)
########################################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

########################################################
# java
########################################################
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64

########################################################
# virtualenvwrapper
########################################################
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON="$(which python3)"  # Usage of python3
source $HOME/.local/bin/virtualenvwrapper.sh

########################################################
# ssh (Google VM Instance)
########################################################
GCP_VM_IP='34.105.108.253'
GCP_PRIVATE_KEY='$HOME/.ssh/gcp_key'
alias ssh_gcp="ssh -i ${GCP_PRIVATE_KEY}  choi_byoungyun@${GCP_VM_IP}"

########################################################
# TurtleShip
########################################################
export PROD_IP="52.78.90.91"
export DEV_IP="13.124.121.176"

alias prod_ssh="ssh bychoi@${PROD_IP}"
alias prod_sftp="sftp bychoi@${PROD_IP}"
alias dev_ssh="ssh bychoi@${DEV_IP}"
alias dev_sftp="sftp bychoi@${DEV_IP}"
alias prod_mysql='mysql --prompt="(PROD)[\d]" -h ${PROD_IP} -D tc_drf_service_tobe -u bychoi -p'
alias dev_mysql='mysql --prompt="(DEV)[\d]" -h ${DEV_IP} -D tc_api_dev_tobe -u bychoi -p'
alias vbox_mysql='mysql --prompt="(\h)[\d]" -D vbox_turtle -u bychoi -p'
alias vbox_mysql_oauth='mysql --prompt="(\h)[\d]" -D vbox_oauth -u bychoi -p'

########################################################
# alias
########################################################
export EDITOR='vim'
alias ls='ls -CF'
alias edit='$EDITOR'
alias mlog='tail -f /var/log/mysql/mysql.log'
alias git_log='git log --pretty=format:"%h - %an, %ar : %s"'



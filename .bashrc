#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias vim='nvim'
alias ls='eza'
alias c='clear'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias allp='systemctl list-units --type=service --state=running'
alias spt='ncspot'
alias pihole='ssh felixpi@192.168.178.32'

PS1='[\u@\h \W]\$ '


# open neofetch on first terminal
LIVE_COUNTER=$(ps a | awk '{print $2}' | grep -vi "tty*" | uniq | wc -l);
if [ $LIVE_COUNTER -eq 1 ]; then
     neofetch
fi

# add jdk 21 to path and set java_home

export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$JAVA_HOME/bin:$PATH


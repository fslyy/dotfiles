#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias vim='nvim'
alias ls='lsd'
alias c='clear'
alias spt='systemctl --user restart spotifyd.service&&spt'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
PS1='[\u@\h \W]\$ '
neofetch --size 360
LS_COLORS='di=0;36:fi=0;32:*.jpg=0;35:*.png=0;35'
export LS_COLORS


# add jdk 21 to path and set java_home

export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$JAVA_HOME/bin:$PATH


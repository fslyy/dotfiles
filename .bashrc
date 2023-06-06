#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='lsd'
alias c='clear'
alias spt='systemctl --user restart spotifyd.service&&spt'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
PS1='[\u@\h \W]\$ '
neofetch --size 370
LS_COLORS='di=0;36:fi=0;32:*.jpg=0;35:*.png=0;35'
export LS_COLORS
export BW_SESSION="Aat3/Vs03mH5Pm2/nDGJqKB7NZCWUs4/+RhUAUiUdep7ekup4zmUP8rGGK3jjaG7Hsb/+0UUZfUNSVvYtE49Bw=Aat3/Vs03mH5Pm2/nDGJqKB7NZCWUs4/+RhUAUiUdep7ekup4zmUP8rGGK3jjaG7Hsb/+0UUZfUNSVvYtE49Bw=="

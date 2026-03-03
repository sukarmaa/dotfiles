#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR='nvim'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ewz='$EDITOR ~/.config/wezterm/wezterm.lua'
PS1='[\u@\h \W]\$ '

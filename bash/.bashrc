#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#start starship
eval "$(starship init bash)"

#execute nerdfetch on startup
if [[ "$TERM" == "xterm-256color" && -z "$ALACRITTY_INIT_DONE" ]]; then
	export ALACRITTY_INIT_DONE=1
	nerdfetch
fi

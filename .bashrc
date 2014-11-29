#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize autocd
shopt -u sourcepath

source "$HOME/.profile"

PROMPT_COMMAND='__chpwd; __right_prompt'

PS1='\[${GREEN}\]\u\[${NO_COLOR}\]@\[${CYAN}\]\h\[${NO_COLOR}\] \[${RED}\]\w\[${NO_COLOR}\] \[$(__return_status)\]\$\[${NO_COLOR}\] '

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize autocd extglob
shopt -u sourcepath

set -o vi

#source "$HOME/.profile"
export LIBASHDIR="$HOME/sv/libash"
source "$LIBASHDIR/libash"

#PROMPT_COMMAND='__chpwd; __right_prompt'
#PROMPT_COMMAND='__chpwd'

#PS1='\[${GREEN}\]\u\[${NO_COLOR}\]@\[${CYAN}\]\h\[${NO_COLOR}\] \[${RED}\]\w\[${NO_COLOR}\] \[$(__return_status)\]\$\[${NO_COLOR}\] '

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -u sourcepath

set -o vi

#source "$HOME/.profile"
export LIBASHDIR="$HOME/sv/libash"
source "$LIBASHDIR/libash"


plan9 () {
  ((!$#)) && return 1
  prog=$1
  shift
  "/usr/lib/plan9/bin/$prog" "$@"
}

posix () {
  ((!$#)) && return 1
  prog=$1
  shift
  "/usr/lib/posix/bin/$prog" "$@"
}

heirloom () {
  ((!$#)) && return 1
  prog=$1
  shift
  "/usr/heirloom/bin/$prog" "$@"
}

suckless () {
  ((!$#)) && return 1
  prog=$1
  shift
  "/usr/suckless/bin/$prog" "$@"
}

snippet () {
  curl "$1" | vim ${2++'set ft='"$2"} +'set ts=2 sts=2 sw=2 sta et' +'normal gg=G' +'set nomodified' - 
}

curlpic () { curl "$1" | feh - ; } 

export ALARMTIME=07:05

#PROMPT_COMMAND='__chpwd; __right_prompt'
#PROMPT_COMMAND='__chpwd'

#PS1='\[${GREEN}\]\u\[${NO_COLOR}\]@\[${CYAN}\]\h\[${NO_COLOR}\] \[${RED}\]\w\[${NO_COLOR}\] \[$(__return_status)\]\$\[${NO_COLOR}\] '

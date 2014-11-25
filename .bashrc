#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

BLUE=$'\e[1;34m'
RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
CYAN=$'\e[1;36m'
WHITE=$'\e[1;37m'
MAGENTA=$'\e[1;35m'
YELLOW=$'\e[1;33m'
NO_COLOR=$'\e[0m'

__right_prompt () {
  #better than nothing, but adding the colors will shift it to the left
  #__git=$(__git_prompt)
  __branch=$(git branch 2> /dev/null | grep "^* " | cut -c 2-)
  if [[ "x$__branch" != "x" ]] ; then
    __status=$(git status --porcelain)
    if [[ "x$__status" != "x" ]] ; then
      __untracked=$(grep "^??" <<< "$__status")
      if [[ "x$__untracked" == "x" ]] ; then
        __branch="${__branch/ /*}"
      else
        __branch="${__branch/ /+}"
      fi
    fi
  fi
  COL=$(tput cols)
  printf "%${COL}s\r" "${__branch}$(__bwbattery)"
}
__chpwd () {
  [[ -n $olddir ]] && [[ $olddir != $PWD ]] && __git_enter
  olddir="$PWD"
}

source "$HOME/.profile"

PROMPT_COMMAND='__chpwd; __right_prompt'
PS1='\[${GREEN}\]\u\[${NO_COLOR}\]@\[${CYAN}\]\h\[${NO_COLOR}\] \[${RED}\]\w\[${NO_COLOR}\] \[$(__return_status)\]\$\[${NO_COLOR}\] '


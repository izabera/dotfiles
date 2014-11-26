#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize

BLUE=$'\e[1;34m'
RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
CYAN=$'\e[1;36m'
WHITE=$'\e[1;37m'
MAGENTA=$'\e[1;35m'
YELLOW=$'\e[1;33m'
NO_COLOR=$'\e[0m'

__right_prompt () {
  #__git=$(__git_prompt)
  __branch=$(git branch 2> /dev/null | grep "^* " | cut -c 2-)
  __width=${#__branch}
  if [[ -n $__branch ]] ; then
    __status=$(git status --porcelain)
    if [[ -n $__status ]] ; then
      __untracked=$(grep "^??" <<< "$__status")
      if [[ -n $__untracked ]] ; then
        __branch="$RED$__branch$NO_COLOR"
      else
        __branch="$YELLOW$__branch$NO_COLOR"
      fi
    else
      __branch="$GREEN$__branch$NO_COLOR"
    fi
  fi
  #if [ -f /sys/class/power_supply/BAT0/capacity ]; then
    #read __val < /sys/class/power_supply/BAT0/capacity
    #read __bat < /sys/class/power_supply/BAT0/status
    #__batterystatus=" "
    ##__width=$(( __width + 12 ))
    #if [[ "$__bat" == "Discharging" ]] ; then
      #__batterystatus+="${RED}[${NO_COLOR}"
    #else
      #__batterystatus+="["
    #fi
    #for (( ; i < 10 ; i++ )) ; do
      #if (( i >= (__val/10) )) ; then
        #__batterystatus+="-"
      #else
        #__batterystatus+="="
      #fi
    #done
    #if [[ "$__bat" == "Discharging" ]] ; then
      #__batterystatus+="${RED}]${NO_COLOR}"
    #else
      #__batterystatus+="]"
    #fi
  #fi
  __width=$((__width - ${#__branch} ))
  printf "%*s\r" "$((COLUMNS-__width))" "$__branch" #$__branch$__batterystatus"
}
__chpwd () {
  [[ -n $__olddir ]] && [[ $__olddir != $PWD ]] && __git_enter
  __olddir="$PWD"
}

source "$HOME/.profile"

PROMPT_COMMAND='__chpwd; __right_prompt'
PS1='\[${GREEN}\]\u\[${NO_COLOR}\]@\[${CYAN}\]\h\[${NO_COLOR}\] \[${RED}\]\w\[${NO_COLOR}\] \[$(__return_status)\]\$\[${NO_COLOR}\] '


HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

setopt appendhistory autocd beep extendedglob nomatch notify prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'  
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
bindkey -v
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit colors zsh/terminfo zmv zrecompile edit-command-line
compinit
colors

zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source $HOME/.profile

BLUE=$'%{\e[1;34m%}'
RED=$'%{\e[1;31m%}'
GREEN=$'%{\e[1;32m%}'
CYAN=$'%{\e[1;36m%}'
WHITE=$'%{\e[1;37m%}'
MAGENTA=$'%{\e[1;35m%}'
YELLOW=$'%{\e[1;33m%}'
NO_COLOR=$'%{\e[0m%}'

PROMPT="${GREEN}%n${NO_COLOR}@${CYAN}%m ${RED}%~${NO_COLOR} %# "

setopt prompt_subst
 
function __git_prompt () {
  __branch=$(git branch 2> /dev/null | grep "^* " | cut -c 2-)
  if [[ "x$__branch" != "x" ]] ; then
    __status=$(git status --porcelain)
    if [[ "x$__status" != "x" ]] ; then
      __untracked=$(grep "^??" <<< "$__status")
      if [[ "x$__untracked" == "x" ]] ; then
        echo "${YELLOW}$__branch${NO_COLOR}"
      else
        echo "${RED}$__branch${NO_COLOR}"
      fi
    else 
      echo -n "${GREEN}$__branch${NO_COLOR}"
    fi
  fi
}

function __battery () {
  if [ -f /sys/class/power_supply/BAT0/capacity ]; then
    read __val < /sys/class/power_supply/BAT0/capacity
    echo -n " ["
    for (( ; i < 10 ; i++ )) ; do
      if (( i >= (__val/10) )) ; then
        echo -n "${RED}=${NO_COLOR}"
      else
        echo -n "${GREEN}=${NO_COLOR}"
      fi
    done
    echo -n "]"
  fi
}

function __return () {
  [[ "$?" == 0 ]] && echo -n "${GREEN}$?${NO_COLOR}" || echo -n "${RED}$?${NO_COLOR}"
}

RPROMPT='$(__return)$(__git_prompt)$(__battery)'

echo "================"
echo " TODO:"
TODO=$(cat $HOME/todo 2> /dev/null)
if [[ -z "$TODO" ]]; then
  echo "nothing"
else
  echo "$TODO"
fi
echo "================"

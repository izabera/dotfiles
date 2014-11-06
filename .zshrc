# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory autocd beep extendedglob nomatch notify prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'  
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/izabera/.zshrc'

autoload -Uz compinit colors zsh/terminfo zmv zrecompile
compinit
# End of lines added by compinstall

source /home/izabera/.profile

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
autoload colors zsh/terminfo
colors
 
function __git_prompt {
  git rev-parse --git-dir >& /dev/null
  if [[ $? == 0 ]]
  then
    if [[ $(git ls-files -u >& /dev/null) == '' ]]
    then
      git diff --quiet >& /dev/null
      if [[ $? == 1 ]]
      then
        echo -n $YELLOW
      else
        git diff --quiet >& /dev/null
        if [[ $? == 1 ]]
        then
          echo -n $YELLOW
        else
          echo -n $GREEN
        fi
      fi
    else
      echo -n $RED
    fi
    echo -n $(git branch | grep -E '^\* ' | sed 's/..//')
    echo -n $NO_COLOR
  fi
}

RPROMPT='$(__git_prompt)'

echo "================"
echo " TODO:"
TODO=$(cat /home/izabera/todo 2> /dev/null)
if [[ -z "$TODO" ]]; then
  echo "nothing"
else
  echo "$TODO"
fi
echo "================"

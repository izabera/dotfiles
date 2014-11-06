# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory autocd beep extendedglob nomatch notify PROMPT_SUBST
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'  
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/izabera/.zshrc'

autoload -Uz compinit
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

GITBRANCH=$(git branch &> /dev/null)
[[ -n "$GITBRANCH" ]] && GITSTATUS=$(git status --porcelain)
[[ $(grep -E "^\?\?" <<< "$GITSTATUS") ]] && GITUNSTAGED="${MAGENTA}+${NO_COLOR}" || GITUNSTAGED=
[[ $(grep -E "^.?M" <<< "$GITSTATUS") ]] && GITSTAGED="${BLUE}*${NO_COLOR}" || GITSTAGED=
[[ -n "$GITBRANCH" ]] && GITSTATUS=$(git status --porcelain) || GITSTATUS=

RPROMPT="$GITUNSTAGED$GITSTAGED$GITBRANCH"
#RPROMPT='$(git branch &> /dev/null && [[ -n $(git status --porcelain) ]] && echo "${MAGENTA}+${NO_COLOR}")$(git branch &> /dev/null && [[ -n $(git status --untracked-files=no --porcelain) ]] && echo "${BLUE}*${NO_COLOR}")$(git branch 2> /dev/null | sed -e "s/\* /${YELLOW}/" -e "s/\$/&${NO_COLOR}/")'

echo "================"
echo " TODO:"
[[ -z $(cat /home/izabera/todo 2> /dev/null) ]] && echo "nothing"
echo "================"

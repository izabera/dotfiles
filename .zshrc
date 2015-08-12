HISTSIZE=1000000
SAVEHIST=1000000

#source $HOME/.profile

setopt appendhistory autocd beep extendedglob nomatch notify prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'  
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

bindkey -v
zstyle :compinstall filename "$HOME/.zshrc"
bindkey "^[[3~" delete-char
bindkey '^?' backward-delete-char

setopt NO_BEEP

autoload -Uz compinit colors zsh/terminfo zmv zrecompile edit-command-line add-zsh-hook
compinit
colors

zle -N edit-command-line
bindkey -M vicmd v edit-command-line

setopt prompt_subst transientrprompt
 
#add-zsh-hook chpwd __git_enter

#BLUE=$'%{\e[1;34m%}'
#RED=$'%{\e[1;31m%}'
#GREEN=$'%{\e[1;32m%}'
#CYAN=$'%{\e[1;36m%}'
#WHITE=$'%{\e[1;37m%}'
#MAGENTA=$'%{\e[1;35m%}'
#YELLOW=$'%{\e[1;33m%}'
#NO_COLOR=$'%{\e[0m%}'

#PROMPT='${GREEN}%n${NO_COLOR}@${CYAN}%m ${RED}%~${NO_COLOR} $(__return_status)%#${NO_COLOR} '
#RPROMPT='$(__git_prompt)$(__battery)'

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z



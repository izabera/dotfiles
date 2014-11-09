export PATH=$PATH:$HOME/bin

alias ls='ls --color=auto'
alias la='ls -A'
alias l='ls -l'
alias free='free -h'
alias du='du -h'
alias df='df -h'
alias grep='grep --color=auto'

#show the file and quit if it fits on one screen
#alias less='less -FX'
#hate it

alias lsless='ls --color=always | less -R'
alias psgrep='ps aux | grep'
alias psless='ps aux | less'

alias n-di='ssh izabera@77.108.43.95 -p 2003'

alias diff='colordiff'

alias updatedb='sudo updatedb'

export EDITOR=vim

function mkdirc {
  if [ -z "$1" ] || [ -n "$2" ]; then
    echo "Usage: $0 directory"
    return 1
  else
    mkdir -p "$1"
    cd "$1"
  fi
}

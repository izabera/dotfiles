export PATH=$PATH:/home/izabera/bin

alias ls='ls --color=auto'
alias la='ls -A'
alias l='ls -l'
alias free='free -h'
alias du='du -h'
alias df='df -h'
alias lsless='ls --color=always | less -R'

alias n-di='ssh izabera@77.108.43.95 -p 2003'

#alias mkdirc='mkdir -p $1 && cd $1'

alias diff='colordiff'

alias updatedb='sudo updatedb'

function mkdirc {
  if [ -z "$1" ] || [ -n "$2" ]; then
    echo "Usage: $0 directory"
    return 1
  else
    mkdir -p "$1"
    cd "$1"
  fi
}

export PATH=$PATH:$HOME/bin

alias ls='ls -h --color=auto'
alias la='ls -A'
alias l='ls -l'
alias free='free -h'
alias du='du -h'
alias df='df -h'
alias grep='grep --color=auto'

alias funkyass='mpv http://funkadelica.duckdns.org:8000/funkentelechy.ogg'
alias musicaringa='mpv http://music.arin.ga:35745/mpd.ogg'

#show the file and quit if it fits on one screen
#alias less='less -FX'
#hate it

alias lsless='ls --color=always | less -R'
alias psless='ps aux | less'
#easier than pgrep
psgrep () {
  ps aux | grep "$1" | grep -v "grep"
}

alias {:q,:wq,:wqa,:qa,:x,:xa}=exit
alias :e=vim
alias :h=man
alias info='info --vi-keys'

alias sn-di='ssh izabera@77.108.43.95 -p 2003'
alias sletame='ssh 31.220.48.33 -p 2212'
alias saringa='if [[ "$HOST" == izaserver ]]; then cd /var/www/arin.ga/public_html ; else ssh arin.ga ; fi'

alias diff='colordiff'

alias updatedb='sudo updatedb'

export EDITOR=vim

mkdirc () {
  if [ -z "$1" ] || [ -n "$2" ]; then
    echo "Usage: $0 directory"
    return 1
  else
    mkdir -p "$1"
    cd "$1"
  fi
}

uprm () {
  temp=$(basename $PWD)
  cd .. && rm -rf "$temp"
}

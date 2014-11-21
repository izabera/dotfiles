export PATH=$PATH:$HOME/bin

alias ls='ls -h --color=auto'
alias la='ls -A'
alias l='ls -l'
alias free='free -h'
alias du='du -h'
alias df='df -h'
alias grep='grep --color=auto'
alias lynx='lynx -accept-all-cookies'

alias funkyass='mpv http://funkadelica.duckdns.org:8000/funkentelechy.ogg'
alias musicaringa='mpv http://music.arin.ga:35745/mpd.ogg'

#show the file and quit if it fits on one screen
#alias less='less -FX'
#hate it

alias lsless='ls --color=always | less -R'
alias psless='ps aux | less'
#easier than pgrep
psgrep () {
  ps -C "$1" -o pid= | while read pid ; do echo $pid ; done
  #ps aux | grep "$1" | grep -v "grep"
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

echo "================"
echo " TODO:"
TODO=$(cat $HOME/todo 2> /dev/null)
if [[ -z "$TODO" ]]; then
  echo "nothing"
else
  echo "$TODO"
fi
echo "================"

__git_enter () {
  __status=$(git status --porcelain 2>/dev/null)
  if [[ "x$__status" != "x" ]] ; then
    git status
  fi
}

__git_prompt () {
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

__battery () {
  if [ -f /sys/class/power_supply/BAT0/capacity ]; then
    read __val < /sys/class/power_supply/BAT0/capacity
    read __bat < /sys/class/power_supply/BAT0/status
    echo -n " "
    [[ "$__bat" == "Discharging" ]] && echo -n "${RED}"
    echo -n "[${NO_COLOR}"
    for (( ; i < 10 ; i++ )) ; do
      if (( i >= (__val/10) )) ; then
        echo -n "${RED}=${NO_COLOR}"
      else
        echo -n "${GREEN}=${NO_COLOR}"
      fi
    done
    [[ "$__bat" == "Discharging" ]] && echo -n "${RED}"
    echo -n "]${NO_COLOR}"
  fi
}

__return () {
  [[ "$?" == 0 ]] && echo -n "${GREEN}$?${NO_COLOR}" || echo -n "${RED}$?${NO_COLOR}"
}

#this version that only shows if something went wrong, which is good for coloring the PS1
__return_status () {
  [[ "$?" == 0 ]] && echo -n "${GREEN}" || echo -n "${RED}"
}


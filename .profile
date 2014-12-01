if [ "$HOST" = izaserver ] ; then
  export PATH="/usr/local/texlive/2014/bin/x86_64-linux:$PATH:$HOME/bin"
  alias saringa='cd /var/www/arin.ga/public_html'
else
  export PATH="$PATH:$HOME/bin"
  alias saringa='ssh arin.ga'
fi
export ENV="$HOME/.profile"

alias la='ls -A'
alias ll='ls -Al'
alias l='ls -l'
alias du='du -h'
alias df='df -h'
alias lynx='lynx -accept-all-cookies'
alias fbterm='fbterm --font-size=11 --term=fbterm'

alias funkyass='mpv http://funkadelica.duckdns.org:8000/funkentelechy.ogg'
alias musicaringa='mpv http://music.arin.ga:35745/mpd.ogg'

alias ..='cd ..'
alias ...='cd ../..'

# bash or zsh or busybox sh

if [ "$BASH_VERSION" ] ; then
  alias -- -='[ "$OLDPWD" ] && cd - || printf "%s\n" "$PWD"'
elif  [ "$ZSH_VERSION" ] ; then
  alias -- "."=source
  alias -- -='cd -'
else
  alias -='cd -'
fi

if [ "$BASH_VERSION" ] || [ "$ZSH_VERSION" ] ; then
  alias ls='ls -h --color=auto'
  alias grep='grep --color=auto'
  alias free='free -h'
  PS1='$GREEN\u$NO_COLOR@$CYAN\h$NO_COLOR $RED\w$NO_COLOR $(__return_status)\$$NO_COLOR '
else
  alias ls='ls -h'
fi


#BLUE=$'\e[1;34m'
#RED=$'\e[1;31m'
#GREEN=$'\e[1;32m'
#CYAN=$'\e[1;36m'
#WHITE=$'\e[1;37m'
#MAGENTA=$'\e[1;35m'
#YELLOW=$'\e[1;33m'
#NO_COLOR=$'\e[0m'
BLUE=$(tput setaf 4)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
YELLOW=$(tput setaf 3)
NO_COLOR=$(tput sgr 0)


#show the file and quit if it fits on one screen
#alias less='less -FX'
#hate it

alias lsless='ls --color=always | less -R'
alias psless='ps aux | less'

#easier than pgrep
psgrep () {
  #ps -C "$1" -o pid= | while read pid ; do echo $pid ; done
  __ps_aux=$(ps aux)
  
  #ps aux | grep "$1" | grep -v "grep"
}

#alias {:q,:wq,:wqa,:qa,:x,:xa}=exit
#fucking idiotic sh
alias :q=exit
alias :wq=exit
alias :wqa=exit
alias :x=exit
alias :xa=exit
alias :e=vim
alias :h=man
alias info='info --vi-keys'

alias sn-di='ssh izabera@77.108.43.95 -p 2003'
alias sletame='ssh 31.220.48.33 -p 2212'

alias diff='colordiff'

alias updatedb='sudo updatedb'

export EDITOR=vim

mkdirc () {
  if ! [ -n "$1" ] || [ -n "$2" ]; then
    printf "Usage: %s directory" "$0"
    return 1
  else
    mkdir -p "$1"
    cd "$1"
  fi
}

uprm () {
  if [ "${PWD%/*}" = /home ] ; then
    echo Nope.
    return 1
  else
    cd .. && rm -rf "$OLDPWD"
  fi
}

yt () { youtube-dl "$1" -o - | mpv - ; }

TODO=$(cat $HOME/todo 2> /dev/null)
if ! [ -n "$TODO" ]; then TODO=nothing ; fi

cat << EOF
================
 TODO:
$TODO
================
EOF

__git_enter () {
  __status=$(git status --porcelain 2>/dev/null)
  if [ -n "$__status" ] ; then
    git status
  fi
}

__git_prompt () {
  __branch=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [ -n "$__branch" ] ; then
    __status=$(git status --porcelain)
    if [ -n "$__status" ] ; then
      #__untracked=$(grep "^??" <<< "$__status")
      __untracked=$(printf "%s" "$__status" | grep "^??")
      if [ -n "$__untracked" ] ; then
        printf "%s%s%s" "$RED" "$__branch" "$NO_COLOR"
      else
        printf "%s%s%s" "$YELLOW" "$__branch" "$NO_COLOR"
      fi
    else 
      printf "%s%s%s" "$GREEN" "$__branch" "$NO_COLOR"
    fi
  fi
}

__battery () {
  if [ -f /sys/class/power_supply/BAT0/capacity ]; then
    read __val < /sys/class/power_supply/BAT0/capacity
    read __bat < /sys/class/power_supply/BAT0/status
    if [ "$__bat" = "Discharging" ]; then
      printf " %s[%s" "$RED" "$NO_COLOR"
    else
      printf " ["
    fi
    #for (( i = 0 ; i < 10 ; i++ )) ; do
      #if (( i >= (__val/10) )) ; then
      #fucking sh
    for i in {0..10} ; do
      if [ $i -gt $((__val/10)) ] ; then
        printf '%s=%s' "$RED" "$NO_COLOR"
      else
        printf '%s=%s' "$GREEN" "$NO_COLOR"
      fi
    done
    if [ "$__bat" = "Discharging" ]; then
      printf "%s]%s" "$RED" "$NO_COLOR"
    else
      printf "]"
    fi
  fi
}

__bwbattery () {
  if [ -f /sys/class/power_supply/BAT0/capacity ]; then
    read __val < /sys/class/power_supply/BAT0/capacity
    read __bat < /sys/class/power_supply/BAT0/status
    printf " ["
    for i in {0..10} ; do
      if [ $i -gt $((__val/10)) ] ; then
        printf -- "-"
      else
        printf "="
      fi
    done
    printf "]"
  fi
}

__return () {
  [ "$?" = 0 ] && printf "%s%d%s" "$GREEN" "$?" "$NO_COLOR" || printf "%s%d%s" "$RED" "$?" "$NO_COLOR"
}

#this version that only shows if something went wrong, which is good for coloring the PS1
__return_status () {
  [ "$?" = 0 ] && printf "%s" "$GREEN" || printf "%s" "$RED"
}

__right_prompt () {
  __branch=$(git symbolic-ref --short HEAD 2> /dev/null)
  __width=${#__branch}
  if [ -n "$__branch" ] ; then
    __status=$(git status --porcelain)
    if [ -n "$__status" ] ; then
      __untracked=$(printf "%s\n" "$__status" | grep "^??")
      if [ -n "$__untracked" ] ; then
        __branch="$RED$__branch$NO_COLOR"
      else
        __branch="$YELLOW$__branch$NO_COLOR"
      fi
    else
      __branch="$GREEN$__branch$NO_COLOR"
    fi
  fi

  if [ -f /sys/class/power_supply/BAT0/capacity ]; then
    read __val < /sys/class/power_supply/BAT0/capacity
    read __bat < /sys/class/power_supply/BAT0/status
    __batterystatus=" "
    if [ "$__bat" = "Discharging" ] ; then
      __batterystatus+="$RED[$NO_COLOR"
      #__width=$((__width - 22 ))
    else
      __batterystatus+="["
    fi
    for i in {0..10} ; do
      if [ $i -gt $((__val/10)) ] ; then
        #__width=$((__width - 11 ))
        __batterystatus+="${RED}=${NO_COLOR}"
      else
        #__width=$((__width - 11 ))
        __batterystatus+="${GREEN}=${NO_COLOR}"
      fi
    done
    if [ "$__bat" = "Discharging" ] ; then
      __batterystatus+="$RED]$NO_COLOR"
    else
      __batterystatus+="]"
    fi
  fi
  __width=$((__width - ${#__branch} ))
  #printf "%*s\r" "$((COLUMNS-__width))" "$__branch" #$__batterystatus"
  printf "%*s\r" "$((COLUMNS-__width))" "$__branch$__batterystatus"
  #printf "%*s\r" "$((COLUMNS))" "$__branch" # $__batterystatus"
}

__chpwd () {
  [ -n "$__olddir" ] && ! [ "$__olddir" = "$PWD" ] && __git_enter
  __olddir="$PWD"
}

backup () {
  for file ; do cp "$file" "/backup/$(date +%Y-%m-%d-%H-%M-%S-)${file##*/}" ; done
}

HISTFILE=~/.histfile
#PS1='\[${GREEN}\]\u\[${NO_COLOR}\]@\[${CYAN}\]\h\[${NO_COLOR}\] \[${RED}\]\w\[${NO_COLOR}\] \[$(__return_status)\]\$\[${NO_COLOR}\] '

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -u sourcepath

set -o vi

export LIBASHDIR="$HOME/sv/libash"
source "$LIBASHDIR/libash"

export PATH="/usr/local/texlive/2014/bin/x86_64-linux:$PATH:$HOME/bin:$HOME/.cabal/bin:/usr/heirloom/bin"

plan9 () {
  ((!$#)) && return 1
  local prog=$1
  shift
  "/usr/lib/plan9/bin/$prog" "$@"
}

posix () {
  ((!$#)) && return 1
  local prog=$1
  shift
  "/usr/lib/posix/bin/$prog" "$@"
}

heirloom () {
  ((!$#)) && return 1
  local prog=$1
  shift
  "/usr/heirloom/bin/$prog" "$@"
}

suckless () {
  ((!$#)) && return 1
  local prog=$1
  shift
  "/usr/suckless/bin/$prog" "$@"
}

snippet () {
  [[ $1 ]] && curl "$1" | vim ${2++'set ft='"$2"} \
    +'set ts=2 sts=2 sw=2 sta et' +'normal gg=G' +'set nomodified' - 
}

curlpic () { curl "$1" | feh - ; } 

export ALARMTIME=07:05

export EDITOR=vim

dmsgl () { dmesg --color=always | less -R +G; }
dmsgw () { watch sh -c 'dmesg | tail'; }

alias sletame='ssh 31.220.48.33 -p 2212'
alias saringa='ssh arin.ga'

# pacman wrapper that will ask for a password only when it's needed
pacman () (
  # juggling fd 1 and 2 to pass only stderr to the while loop
  exec 3>&2 2>&1 1>&3 3>&-
  if command pacman "$@" 3>&2 2>&1 1>&3 3>&- | {
    needroot=false
    while read -r -e || { printf %s "$REPLY"; false; } ; do
      if [[ $REPLY = 'error: you cannot perform this operation unless you are root.' ]]; then
        needroot=true
        break
      else
        printf '%s\n' "$REPLY"
      fi
    done
    "$needroot"
  } ; then sudo pacman "$@" 3>&2 2>&1 1>&3 3>&- ; else exit $PIPESTATUS ; fi
)

w101 () { wine "$HOME/.wine/drive_c/users/Public/Application Data/Wizard101(IT)/Wizard101.exe"; }


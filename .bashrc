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

w101 () (
  wine "$HOME/.wine/drive_c/users/Public/Application Data/Wizard101(IT)/Wizard101.exe" &
) &> /dev/null


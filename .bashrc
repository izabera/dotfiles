#
# ~/.bashrc
#
alias chmox='chmod +x'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#shopt -s checkwinsize
shopt -u sourcepath

set -o vi

# never use this anyway
set +H

export LIBASHDIR="$HOME/sv/libash"
source "$LIBASHDIR/libash"

path=(
  /usr/local/texlive/2015/bin/x86_64-linux
  #/usr/local/sbin
  /usr/local/bin
  /usr/bin
  #/usr/bin/site_perl
  #/usr/bin/vendor_perl
  /usr/bin/core_perl
  "$HOME"/bin
  "$HOME"/.cabal/bin
  /usr/lib/plan9/bin
  #/usr/heirloom/bin
  /usr/suckless/bin
  "$HOME"/.gem/ruby/2.2.0/bin
)
IFS=: eval 'export PATH="${path[*]}"'

plan9 () { (($#)) && ( exec -a "$1" "/usr/lib/plan9/bin/$@" ); }
_plan9 () {
  if (( ${#COMP_WORDS[@]} < 3 )); then
    comp=(/usr/lib/plan9/bin/"${COMP_WORDS[COMP_CWORD]}"*)
    COMPREPLY=("${comp[@]##*/}")
  else
    compopt -o bashdefault
    compopt -o default
    compopt -o filenames
  fi
}
complete -F _plan9 plan9

#posix () {
  #((!$#)) && return 1
  #local prog=$1
  #shift
  #"/usr/lib/posix/bin/$prog" "$@"
#}
#_posix () {
  #if (( ${#COMP_WORDS[@]} < 3 )); then
    #comp=(/usr/lib/posix/bin/"${COMP_WORDS[COMP_CWORD]}"*)
    #COMPREPLY=("${comp[@]##*/}")
  #else
    #compopt -o bashdefault
    #compopt -o default
    #compopt -o filenames
  #fi
#}
#complete -F _posix posix

#heirloom () {
  #((!$#)) && return 1
  #local prog=$1
  #shift
  #"/usr/heirloom/bin/$prog" "$@"
#}
#_heirloom () {
  #if (( ${#COMP_WORDS[@]} < 3 )); then
    #comp=(/usr/heirloom/bin/"${COMP_WORDS[COMP_CWORD]}"*)
    #COMPREPLY=("${comp[@]##*/}")
  #else
    #compopt -o bashdefault
    #compopt -o default
    #compopt -o filenames
  #fi
#}
#complete -F _heirloom heirloom

suckless () { (($#)) && ( exec -a "$1" "/usr/suckless/bin/$@" ); }
_suckless () {
  if (( ${#COMP_WORDS[@]} < 3 )); then
    comp=(/usr/suckless/bin/"${COMP_WORDS[COMP_CWORD]}"*)
    COMPREPLY=("${comp[@]##*/}")
  else
    compopt -o bashdefault
    compopt -o default
    compopt -o filenames
  fi
}
complete -F _suckless suckless

snippet () {
  [[ $1 ]] && curl -s "$1" | vim ${2++'set ft='"$2"} \
    +'set ts=2 sts=2 sw=2 sta et' +'normal gg=G' +'set nomodified' - 
}

curlpic () { curl "$1" | feh - ; } 

export ALARMTIME=07:05

export EDITOR=vim

dmsgl () { dmesg --color=always | less -R +G; }

alias amazon='ssh arin.ga'

_shelltest () {
  local bashes bourneish posix allsh IFS=$' \t\n'
  bashes=(bash2.05 bash3.0 bash3.1 bash3.2 bash4.0 bash4.1 bash4.2 bash4.3)
  bourneish=("${bashes[@]}" bsh bush dash jsh ksh mksh pdksh posh yash zsh)
  posix=("${bashes[@]}" bush dash ksh mksh pdksh posh yash zsh)
  allsh=("${bashes[@]}" bsh bush csh dash fish jsh ksh mksh osh pdksh posh sh6 rc tcsh yash zsh)
  COMPREPLY=("${bashes[*]}" "${bourneish[*]}" "${posix[*]}" "${allsh[*]}")
}
complete -F _shelltest shelltest

_rrlwrap () {
  if (( COMP_CWORD == 1 )); then
    mapfile -t COMPREPLY < <(compgen -c -- "${COMP_WORDS[COMP_CWORD]}")
  else
    compopt -o bashdefault
    compopt -o default
  fi
}
complete -F _rrlwrap rrlwrap

# cabal-install messes with polipo
cabal () (
  unset http_proxy
  command cabal "$@"
)

export IGNOREEOF=1
export PAGER=less
#export MANPAGER=less
#export GIT_PAGER=less

alias pstree='pstree -A'
alias leave='uprm;:q'
alias ed='rlwrap ed'
alias dc='rlwrap dc'
alias wifi-menu='sudo wifi-menu'
_youtube-dl () {
  history 1 | {
    read -ra array
    cd ~/video
    command youtube-dl "${array[@]:2}"
  }
}
alias youtube-dl="_youtube-dl #"
HISTSIZE=-1
HISTFILESIZE=-1
calc () { gawk -OM "BEGIN { print $* }"; }
alias calc='noglob calc'
alias dash='rlwrap -ic dash'
alias posh='rlwrap -ic posh'
alias odc='od -An -c'
alias odxc='od -An -tx1c'
alias oddc='od -An -td1c'
shellcheck () {
  if (( $# )); then
    shellcheck "$@"
  else
    rlwrap --history-filename=/dev/null shellcheck -s bash -
  fi
}
_hostcolor=6
alias rc='rlwrap rc'

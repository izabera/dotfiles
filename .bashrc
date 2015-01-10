#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -u sourcepath

set -o vi

#source "$HOME/.profile"
export LIBASHDIR="$HOME/sv/libash"
source "$LIBASHDIR/libash"

export PATH="$PATH:$HOME/bin"

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
  curl "$1" | vim ${2++'set ft='"$2"} +'set ts=2 sts=2 sw=2 sta et' +'normal gg=G' +'set nomodified' - 
}

curlpic () { curl "$1" | feh - ; } 

export ALARMTIME=07:05

export EDITOR=vim



shelltest () (
  shells=(bash bsh bush dash jsh ksh mksh pdksh posh zsh)
  while getopts :oOhs: opt ; do
    case $opt in
      o) oneline=true;;
      O) oneline=false;;
      h) cat << EOF
Test code with various shells.

Usage: shelltest [options] [shells] -- [parameters for the shell]

Examples: shelltest -O
          shelltest bash dash -- -c 'echo foo'    (only two shells)
          shelltest -o -- -- -c 'echo foo'        (default shells)
          shelltest -s csh -s rc -s fish          (three more shells)

If no shell is selected, the following will be tested:
${shells[@]}

Options that follow the -- will be passed to the shell.

Options:  -o   print in a single line (default)
          -O   print in multiple lines with headers
          -s   select all the default shells + an additional one
          -h   print this help
EOF
          exit;;
      s) shells+=("$OPTARG") ;;
      :) echo "No shell selected for -$OPTARG" >&2; exit 1;;
      \?) echo "Unknown option: $OPTARG" >&2; exit 1;;
    esac
  done
  shift $((OPTIND-1))
  for opt do
    [[ $opt = -- ]] && shift && break;
    newshells+=("$opt")
    shift
  done
  ((${#newshells[@]})) && shells=("${newshells[@]}")
  for shell in "${shells[@]}" ; do
    "${oneline:=true}" && printf '%8s: ' "$shell" ||
      { ((i++)) && printf '\n'; printf '==> %s <==\n' "$shell"; }
    "$shell" "$@" < /dev/fd/0
  done <<< "$(cat)"
)

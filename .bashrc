#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize autocd extglob
shopt -u sourcepath

set -o vi

source "$HOME/.profile"

#PROMPT_COMMAND='__chpwd; __right_prompt'
PROMPT_COMMAND='__chpwd'

aringa-helper() {
  history 1 | {
    read _ _ command
    dir=${PWD/#"$HOME"/\~\/} dir=${dir/\/}
    {
      printf '%s@%s %s $ %s\n' "$USER" "$HOSTNAME" "$dir" "$command"
      eval "$command"
      printf '\n------------ exit code %d ------------\n' $? 
    } |& tee >(curl -sF 'aringa=<-' arin.ga | xclip)
  }
}
alias caringa='aringa-helper #'

PS1='\[${GREEN}\]\u\[${NO_COLOR}\]@\[${CYAN}\]\h\[${NO_COLOR}\] \[${RED}\]\w\[${NO_COLOR}\] \[$(__return_status)\]\$\[${NO_COLOR}\] '

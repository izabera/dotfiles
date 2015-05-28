source ~/.bashrc
return
TODO=$(cat "$HOME"/todo 2> /dev/null)
cat << EOF
================
 TODO:
${TODO:-nothing}
================
EOF

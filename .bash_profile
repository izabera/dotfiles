source ~/.bashrc

TODO=$(cat "$HOME"/todo 2> /dev/null)
cat << EOF
================
 TODO:
${TODO:-nothing}
================
EOF

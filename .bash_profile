# keep the window alive in case of crash
bash
case $? in
     131) echo Quit           ;;
     134) echo Aborted        ;;
     137) echo Killed         ;;
     139) echo Segfault       ;;
# 1[34]?) echo "Exit code $?" ;; # don't care
       *) exit
esac >&2
unset IGNOREEOF

source ~/.bashrc

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    export DISPLAY=:0
    xfce4-terminal &
fi


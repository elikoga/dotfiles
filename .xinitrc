#!/bin/sh

[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources
[ -f "$HOME/.xprofile" ] && . ~/.xprofile


exec i3

#!/bin/bash
shopt -s autocd

COLOR0="\[$(tput setaf 0)\]"
COLOR1="\[$(tput setaf 1)\]"
COLOR2="\[$(tput setaf 2)\]"
COLOR3="\[$(tput setaf 3)\]"
COLOR4="\[$(tput setaf 4)\]"
COLOR5="\[$(tput setaf 5)\]"
COLOR6="\[$(tput setaf 6)\]"
COLOR7="\[$(tput setaf 7)\]"
COLORRESET="\[$(tput sgr0)\]"
BOLD="\[$(tput bold)\]"


#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
export PS1="${BOLD}${COLOR1}[${COLOR2}\u${COLOR3}@${COLOR4}\h ${COLOR5}\W${COLOR1}]${COLOR7}\$ ${COLORRESET}"


export GTK_IM_MODULE=ibus
export QT4_IM_MODULE=xim
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export GLFW_IM_MODULE=ibus


[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

export PF_INFO="ascii title os host kernel uptime pkgs memory shell editor wm de palette"

pfetch


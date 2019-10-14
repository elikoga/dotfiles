#!/bin/sh
# Profile file; Runs on login.

export PATH="$(find $HOME/.local/bin -type d | tr '\n' ':' | sed "s/:*$//"):$PATH"
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export READER="zathura"
export FILE="vu"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

# Jupyter Paths
export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab

# Start mpd if not already running
pgrep -u $USER mpd >/dev/null 2>&1 || mpd

# If shortcuts dont exist, create them
[ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

# Start the ssh-agent
eval $(ssh-agent)

# Source .bashrc if bash is the current shell
echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Switch escape and caps
loadkeys ~/.local/bin/ttymaps.kmap 2>/dev/null

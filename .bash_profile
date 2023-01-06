# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export EDITOR="nvim"
export VISUAL="nvim"
export LESSHISTFILE="-"
export QT_QPA_PLATFORMTHEME="qt5ct"
export TERMINAL="alacritty"

# start ssh agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
fi

# Window Manager
export CM_DIR="$HOME/.cache/clipmenu"
export _JAVA_AWT_WM_NONREPARENTING=1

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.bin/dwmscript" ] ;
  then PATH="$HOME/.bin/dwmscript:$PATH"
fi

if [ -d "/home/mat/.bin/runit" ] ;
  then PATH="$HOME/.bin/runit:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# Start graphical server on user's current tty if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx

# ~/.profile: executed by the command interpreter for login shells.

export EDITOR=nvim
 export BROWSER="brave-browser"
export MANPAGER="nvim +Man!"
export CM_LAUNCHER=rofi
export CM_IGNORE_WINDOW="KeePassXC"

export $(gnome-keyring-daemon --daemonize --start)

# if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/bin/secret" ]; then
    PATH="$HOME/.local/bin/secret:$PATH"
fi

if [ -f ~/.local/bin/secret/env ]; then
    . ~/.local/bin/secret/env
fi

if [ -d "$HOME/.local/bin/awesome" ]; then
    PATH="$HOME/.local/bin/awesome:$PATH"
fi

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

. "$HOME/.cargo/env"

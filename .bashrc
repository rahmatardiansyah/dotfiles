# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[0m\][\[\e[0;31m\]\u\[\e[0m\]@\[\e[0;31m\]\H \[\e[0;96m\]\W\[\e[0m\]]\[\e[0m\]$ \[\e[0m\]'

# source alias file
if [ -f ~/.aliases ]; then
. ~/.aliases
fi

# source fzf keybinds
if [ -f /usr/share/fzf/key-bindings.bash ]; then
. /usr/share/fzf/key-bindings.bash
fi

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

bind '"\C-o":"lfcd\C-m"'

export HISTCONTROL=ignoreboth:erasedups

# Add default node to path
#export PATH=~/.nvm/versions/node/v16.16.0/bin:$PATH
export PATH=~/.nvm/versions/node/v18.12.1/bin:$PATH

# Load NVM
export NVM_DIR=~/.nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --no-use

elfman

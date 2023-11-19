alias ls="exa --group-directories-first"
alias la="ls -a"
alias ll="ls -alFh"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias cat='batcat --style=plain'

alias ".."="cd .."
alias "..."="cd ../.."

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

alias rm="trash-put"

alias ssh-art="ssh-add ~/.ssh/id_rsa_mint"

alias pastefile="curl -F 'file=@-' 0x0.st <"
alias pastecmd="curl -F 'file=@-' 0x0.st"
alias ggrl="gist --list rahmatardiansyah"
alias ggrd="gist --delete"

# rclone
alias drive-rahmatnsn="rclone mount rahmatnsn_drive: /home/rahmat/.local/gdrive/rahmatnsn"
alias unmount-rahmatnsn="fusermount -u ~/.local/gdrive/rahmatnsn"
alias drive-rahmatardiansyah147="rclone mount rahmatardiansyah147_drive: /home/rahmat/.local/gdrive/rahmatardiansyah147"
alias unmount-rahmatardiansyah147="fusermount -u ~/.local/gdrive/rahmatardiansyah147"
alias drive-rahmat21="rclone mount rahmat21_drive: /home/rahmat/.local/gdrive/rahmat21"
alias unmount-rahmat21="fusermount -u ~/.local/gdrive/rahmat21"

# yt-dlp
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

# git
alias bare='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias gtl='git log --decorate --oneline --graph'

# Pacman package manager
# alias install='sudo pacman -S'
# alias update='sudo pacman -Sy'
# alias upgrade='sudo pacman -Syu'
# alias uninstall='sudo pacman -Rns'
# alias search='pacman -Ss'
# alias searchinstalled='pacman -Q | grep'
# alias listinstalled='pacman -Q'
# alias listmain='pacman -Qn'
# alias listaur='pacman -Qm'
# alias totalpkgs='pacman -Q | wc -l'
# alias orphanpkgs='pacman -Qdt'
# alias removecache='sudo pacman -Sc'

# Yay
# alias upgradeall='yay -Syu --sudoloop'

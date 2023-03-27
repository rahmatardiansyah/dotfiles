{ config, pkgs, pkgs-unstable, ... }:

{
  home.username = "mat";
  home.homeDirectory = "/home/mat";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    git
    lazygit
    bat
    htop
    btop
    direnv
    starship
    fzf
    newsboat
    rclone
    figlet
    exa
    neofetch
    tmux
    trash-cli
    texlive.combined.scheme-full
    ranger
    calcurse
    yt-dlp

    pkgs-unstable.neovim
    pkgs-unstable.xclip
    pkgs-unstable.wl-clipboard
    pkgs-unstable.tree-sitter
    pkgs-unstable.ripgrep
    pkgs-unstable.fd
    pkgs-unstable.nixfmt

    nodejs-18_x
    nodePackages.live-server

    gcc
    rustc
    cargo

    joplin-desktop
    vscode
    sublime4
    pavucontrol
    keepassxc
    mpv
    tdesktop
    discord
    obs-studio
    anydesk
    gimp
    pcsx2
    ppsspp
    prismlauncher
    meld
    klavaro
    libreoffice-still
  ];

  imports = [ ./shell.nix ./git.nix ./tools.nix ./dotfiles.nix ];
}

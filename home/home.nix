{ config, pkgs, pkgs-unstable, ... }:
let
in {
  home.username = "rahmat";
  home.homeDirectory = "/home/rahmat";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    # Terminal Apps
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

    # Neovim
    neovim
    xclip
    wl-clipboard
    tree-sitter
    ripgrep
    fd
    nixfmt

    # Programming
    gcc
    nodejs-18_x
    rustc
    cargo

    # Desktop Apps
    alacritty
    vscode
    pavucontrol
    mpv
    gcolor3
    scrcpy
    evince
  ];

  imports = [ ./git.nix ./shell.nix ];
}

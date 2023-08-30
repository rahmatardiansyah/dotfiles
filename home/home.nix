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
    comma

    # Neovim
    neovim
    xclip
    wl-clipboard
    tree-sitter
    ripgrep
    fd
    nixfmt
    stylua
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.prettier

    # Programming
    gcc
    nodejs-18_x
    rustc
    cargo

    # Desktop Apps
    alacritty
    kitty
    vscode
    pavucontrol
    mpv
    celluloid # mpv frontend
    gcolor3
    scrcpy
    evince
    showmethekey
    libreoffice-still
  ];

  imports = [ ./git.nix ./shell.nix ];
}

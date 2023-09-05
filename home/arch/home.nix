{ config, pkgs, pkgs-unstable, ... }:
let
in {
  home.username = "mat";
  home.homeDirectory = "/home/mat";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    git
    lazygit
    exa
    bat
    starship
    fzf
    htop
    btop
    trash-cli
    nixfmt
    rclone
    calcurse
    neofetch
    ranger
    comma
    tmux
    yt-dlp
    texlive.combined.scheme-full

    # Programming
    nodejs_18
    rustc
    cargo

    # Neovim bugs for now
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
  ];

  imports = [ ../git.nix ./shell.nix ./dotfiles.nix ];
}

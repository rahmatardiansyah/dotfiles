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
    exa
    neofetch
    tmux
    trash-cli
    comma

    # Neovim
    neovim
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
  ];

  imports = [ ../git.nix ./shell.nix ];
}

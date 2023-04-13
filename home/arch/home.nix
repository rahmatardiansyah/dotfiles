{ config, pkgs, pkgs-unstable, ... }: {
  home.username = "mat";
  home.homeDirectory = "/home/mat";
  home.stateVersion = "22.11";
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
    tmux
    rclone
    calcurse
    neofetch
    ranger
    zellij
    comma
    texlive.combined.scheme-full
  ];

  imports = [ ../git.nix ./shell.nix ./tools.nix ];
}

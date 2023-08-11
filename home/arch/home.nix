{ config, pkgs, pkgs-unstable, ... }: {
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
    # Programming
    nodejs_18
    rustc
    cargo
    # texlive.combined.scheme-full
  ];

  imports = [ ../git.nix ./shell.nix ./tools.nix ./dotfiles.nix ];
}

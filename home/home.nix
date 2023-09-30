{ config, pkgs, pkgs-unstable, ... }:
let
in {
  home.username = "rahmat";
  home.homeDirectory = "/home/rahmat";
  home.stateVersion = "23.05";
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
    trash-cli
    # texlive.combined.scheme-full
    ranger
    yt-dlp
    comma
    gist
    nixfmt
    translate-shell
    glow
    tealdeer
  ];

  imports = [ ./git.nix ];
}

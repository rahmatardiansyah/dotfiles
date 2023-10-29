{ config, pkgs, pkgs-unstable, ... }:
let
in {
  home.username = "rahmat";
  home.homeDirectory = "/home/rahmat";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    starship
    lazygit
    nixfmt
    gist
    texlive.combined.scheme-full
    thefuck
  ];

  imports = [ ];
}

{ config, pkgs, pkgs-unstable, ... }:
let
in {
  home.username = "mat";
  home.homeDirectory = "/home/mat";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    nixfmt
    # texlive.combined.scheme-full
    # thefuck
  ];

  imports = [ ];
}

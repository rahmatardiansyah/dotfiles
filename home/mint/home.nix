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
    rclone
    calcurse
    neofetch
    ranger
    yt-dlp
    comma
    texlive.combined.scheme-full
    nodejs_18
    rustc
    cargo
    # Neovim
    pkgs-unstable.neovim
    pkgs-unstable.xclip
    pkgs-unstable.tree-sitter
    pkgs-unstable.ripgrep
    pkgs-unstable.fd
    pkgs-unstable.stylua
    nixfmt

    # Window Manager
    pamixer
    clipmenu
  ];

  imports = [ ../git.nix ./shell.nix ./tools.nix ./dotfiles.nix ];
}

{ config, pkgs, pkgs-unstable, ... }:

{
  home.username = "mat";
  home.homeDirectory = "/home/mat";
  home.stateVersion = "22.11";
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
    xcape
    neofetch
    tmux
    trash-cli
    texlive.combined.scheme-full
    slop
    ranger
    calcurse
    exiv2
    mediainfo
    imagemagick
    yt-dlp

    # Terminal
    kitty
    alacritty

    pkgs-unstable.neovim
    pkgs-unstable.xclip
    pkgs-unstable.tree-sitter
    pkgs-unstable.ripgrep
    pkgs-unstable.fd
    pkgs-unstable.nixfmt

    # Development
    nodejs-18_x
    gcc
    rustc
    cargo

    # Prodictivity
    joplin-desktop
    vscode
    sublime4
    pavucontrol
    gnome.gnome-calculator
    keepassxc
    mpv
    scrcpy
    libsForQt5.kcolorchooser
    libsForQt5.ark
    screenkey
    nsxiv
    tdesktop
    discord
    obs-studio
    anydesk
    gimp
    pcsx2
    ppsspp
    prismlauncher
    meld
    klavaro
    flameshot
    brightnessctl
    feh
    dunst
    libnotify
    xcompmgr
    clipmenu
    pamixer
    qt5ct
    arandr
    networkmanagerapplet
  ];

  programs.git = {
    enable = true;
    userName = "Rahmat Ardiansyah";
    userEmail = "rahmatardiansyah147@gmail.com";
    extraConfig = {
      core = { editor = "nvim"; };
      init = { defaultBranch = "main"; };
    };
  };

  programs.bat = {
    enable = true;
    config = { theme = "TwoDark"; };
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "onedark";
      theme_background = false;
    };
  };
}

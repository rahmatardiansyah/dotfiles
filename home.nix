{ config, pkgs, ... }:

{
  home.username = "mat";
  home.homeDirectory = "/home/mat";
  home.stateVersion = "22.11";
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

    # Terminal
    kitty
    alacritty

    neovim
    xclip
    tree-sitter
    ripgrep
    fd
    nixfmt
    yt-dlp

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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mat/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

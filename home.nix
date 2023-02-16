{ config, pkgs, ... }:
let pkgsUnstable = import <nixpkgs-unstable> { };
in {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "mat";
  home.homeDirectory = "/home/mat";

  home.packages = with pkgs; [
    wl-clipboard
    gnome.gnome-tweaks
    (nerdfonts.override { fonts = [ "JetBrainsMono" "SpaceMono" ]; })

    # pengembangan
    gcc
    hugo
    nodejs-18_x
    pkgsUnstable.neovim
    nixfmt
    fzf

    # kerja
    sublime4
    keepassxc
    joplin-desktop
    vscode
    tmux
    newsboat
    lazygit
    rclone
    tdesktop
    discord
    obs-studio
    kooha
    alacritty
    kitty
    wezterm

    # multimedia
    spotify
    mpv

    # tambahan
    exa
    scrcpy
    ripgrep
    fd
    btop
    htop
    showmethekey
    gcolor3
    pavucontrol
    yt-dlp
    nsxiv
    exiv2
    mediainfo
    imagemagick
    calcurse
    klavaro
    figlet
    anydesk
    gimp
    gutenprint
    neofetch
    starship

    # game
    prismlauncher
    pcsx2
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
  
  programs.mpv = {
    enable = true;
    bindings = {
      "r" = "cycle_values video-rotate 90 180 270 0";
      "l" = "vf toggle hflip";
      "L" = "vf toggle vflip";
    };
    config = {
      save-position-on-quit = true;
      autofit-larger = "60%x60%";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

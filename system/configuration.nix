{ config, pkgs, pkgs-unstable, ... }:

{
  imports = [ ./hardware-configuration.nix ./pipewire-conf.nix ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Firewall
  networking.firewall.enable = true;

  # Set your time zone.
  time.hardwareClockInLocalTime = true;
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # i3wm
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [ i3blocks ];
  };

  # Configure keymap in X11
  services.xserver = {
    videoDrivers = [ "amdgpu" ];
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.gutenprint ];

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # User
  users.users.rahmat = {
    isNormalUser = true;
    description = "Rahmat Ardiansyah";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
    packages = with pkgs; [ firefox brave ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flatpak
  services.flatpak.enable = true;

  # Fonts
  fonts.fonts = with pkgs; [
    noto-fonts-emoji
    (pkgs-unstable.nerdfonts.override {
      fonts = [ "FiraCode" "JetBrainsMono" ];
    })
  ];
  fonts.fontDir.enable = true;

  # Enable Docker
  virtualisation.docker.enable = true;

  # Virtual Machine
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    ntfs3g
    vim
    git
    unzip
    wget
    gnome.gnome-tweaks
    gparted
    apple-cursor
    virt-manager

    # Window Manager
    brightnessctl
    lxappearance
    feh
    flameshot
    rofi
    clipmenu
    arandr
    xcompmgr
    dunst
    pamixer
    polkit_gnome
    networkmanagerapplet
    xcape
  ];

  system.stateVersion = "23.05";
}

{ config, pkgs, pkgs-unstable, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports = [ ./hardware-configuration.nix ./pipewire-conf.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "art";
  networking.networkmanager.enable = true;

  time.hardwareClockInLocalTime = true;
  time.timeZone = "Asia/Jakarta";

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

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.windowManager.dwm.enable = true;

  nixpkgs.overlays = [
    (final: prev: { dwm = prev.dwm.overrideAttrs (old: { src = ./dwm; }); })
  ];

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.printing.enable = true;
  services.printing.drivers = [ pkgs.gutenprint ];

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.mat = {
    isNormalUser = true;
    description = "Rahmat Ardiansyah";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ firefox brave unzip ];
  };

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = [ "mat" ];

  fonts.fonts = with pkgs; [
    noto-fonts-emoji
    (pkgs-unstable.nerdfonts.override {
      fonts = [ "FiraCode" "JetBrainsMono" ];
    })
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    vim
    ntfs3g
    (pkgs.callPackage ./cursor.nix { })
    papirus-icon-theme
    rofi
    (pkgs.callPackage ./dwmblocks.nix { })
  ];

  security.polkit.enable = true;
  system.stateVersion = "22.11";
}

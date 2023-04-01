{ config, pkgs, pkgs-unstable, ... }:

{
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

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [ luarocks luadbi-mysql ];
    };
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.printing.enable = true;
  services.printing.drivers = [ pkgs.gutenprint ];

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  users.users.mat = {
    isNormalUser = true;
    description = "Rahmat Ardiansyah";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
    packages = with pkgs;
      [
        firefox
        brave
        virt-manager
        comixcursors.Opaque_Slim_White
        arc-icon-theme
      ] ++ (if (config.services.xserver.desktopManager.gnome.enable) then [
        gnome.gnome-tweaks
        gnome.gnome-terminal
        tilix
      ] else
        [ libsForQt5.kcolorchooser ]);
  };

  nixpkgs.config.allowUnfree = true;

  programs.dconf.enable = true;

  fonts.fonts = with pkgs; [
    noto-fonts-emoji
    (pkgs-unstable.nerdfonts.override {
      fonts = [ "FiraCode" "JetBrainsMono" ];
    })
  ];

  environment.systemPackages = with pkgs; [ git wget unzip vim ntfs3g ];

  system.stateVersion = "22.11";

}

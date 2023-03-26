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
    neofetch
    tmux
    trash-cli
    texlive.combined.scheme-full
    ranger
    calcurse
    yt-dlp

    pkgs-unstable.neovim
    pkgs-unstable.xclip
    pkgs-unstable.wl-clipboard
    pkgs-unstable.tree-sitter
    pkgs-unstable.ripgrep
    pkgs-unstable.fd
    pkgs-unstable.nixfmt

    nodejs-18_x
    nodePackages.live-server

    gcc
    rustc
    cargo

    joplin-desktop
    vscode
    sublime4
    pavucontrol
    keepassxc
    mpv
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
    libreoffice-still
  ];

  programs.bash = {
    enable = true;
    historyControl = [ "erasedups" "ignoredups" "ignorespace" ];
    historyFile = "$HOME/.bash_history";
    historyFileSize = 1000000;
    historySize = 1000000;
    historyIgnore = [ "ls" "cd" "exit" "clear" ];
    shellAliases = {
      ls = "exa --group-directories-first";
      la = "ls -a";
      ll = "ls -alFh";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      cat = "bat";
      rm = "trash-put";
      ssh-art = "ssh-add ~/.ssh/id_rsa_art";
      drive-rahmatnsn =
        "clone mount rahmatnsn_drive: /home/mat/.local/share/drive/rahmatnsn";
      umount-rahmatnsn = "fusermount -u ~/.local/share/drive/rahmatnsn";
      drive-rahmatardiansyah147 =
        "rclone mount rahmatardiansyah147_drive: /home/mat/.local/share/drive/rahmatardiansyah147";
      umount-rahmatardiansyah147 =
        "fusermount -u ~/.local/share/drive/rahmatardiansyah147";
      drive-rahmat21 =
        "rclone mount rahmat21_drive: /home/mat/.local/share/drive/rahmat21";
      umount-rahmat21 = "fusermount -u ~/.local/share/drive/rahmat21";
      nixos-art = "sudo nixos-rebuild switch --flake .#art";
      nixbuildmat = "nix build .#artHm.mat.activationPackage";
    };

    bashrcExtra = ''
        bind '"\C-o":"ranger\n"'
        bind '"\C-f":"tmux-sessionizer\n"'
    '';

    profileExtra = ''
        [[ -d "$HOME"/.local/bin ]] && PATH="$HOME/.local/bin:$PATH"
    '';
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

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

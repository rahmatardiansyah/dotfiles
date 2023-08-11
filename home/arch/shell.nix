{ config, ... }: {
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
      cat = "bat --style=plain";
      catn = "bat";
      rm = "trash-put";
      ssh-art = "ssh-add ~/.ssh/id_rsa_art";
      drive-rahmatnsn =
        "rclone mount rahmatnsn_drive: /home/mat/.local/share/drive/rahmatnsn";
      umount-rahmatnsn = "fusermount -u ~/.local/share/drive/rahmatnsn";
      drive-rahmatardiansyah147 =
        "rclone mount rahmatardiansyah147_drive: /home/mat/.local/share/drive/rahmatardiansyah147";
      umount-rahmatardiansyah147 =
        "fusermount -u ~/.local/share/drive/rahmatardiansyah147";
      drive-rahmat21 =
        "rclone mount rahmat21_drive: /home/mat/.local/share/drive/rahmat21";
      umount-rahmat21 = "fusermount -u ~/.local/share/drive/rahmat21";
      nixbuildmat = "nix build .#artHm.matArch.activationPackage";
      "," = "comma";
      "pastefile" = "curl -F 'file=@-' 0x0.st <";
      "pastecmd" = "curl -F 'file=@-' 0x0.st";
      "update-mirror" = "sudo reflector --sort rate -l 5 --save /etc/pacman.d/mirrorlist";
    };

    bashrcExtra = ''
      bind 'set completion-ignore-case on'
    '';

    # sessionVariables = { QT_QPA_PLATFORMTHEME = "qt5ct"; };

    profileExtra = ''
      [[ -d "$HOME"/.local/bin ]] && export PATH="$HOME/.local/bin:$PATH"
      export $(gnome-keyring-daemon --daemonize --start)
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
    settings = {
      add_newline = false;
      cmd_duration.disabled = true;
      directory = { fish_style_pwd_dir_length = 1; };
      shell = {
        disabled = false;
        unknown_indicator = "mystery shell";
        style = "green bold";
      };
      character = {
        success_symbol = "[➜](bold green)";
        vimcmd_symbol = "[➜](bold yellow)";
        error_symbol = "[✗](bold red)";
      };
    };
  };
}

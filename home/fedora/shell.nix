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
      nixbuildmat = "nix build .#artHm.matFedora.activationPackage";
    };

    bashrcExtra = ''
      bind '"\C-o":"ranger\n"'
      bind '"\C-f":"tmux-sessionizer\n"'
      bind "set completion-ignore-case on"
    '';

    sessionVariables = { };

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

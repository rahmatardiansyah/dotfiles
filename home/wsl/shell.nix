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
      ".." = "cd ..";
      "..." = "cd ../..";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      cat = "bat --style=plain";
      catn = "bat";
      rm = "trash-put";
      ssh-art = "ssh-add ~/.ssh/id_rsa_art";
      "," = "comma";
      nixbuildmat = "nix build .#artHome.rahmatWsl.activationPackage";
    };

    bashrcExtra = ''
      bind "set completion-ignore-case on"
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

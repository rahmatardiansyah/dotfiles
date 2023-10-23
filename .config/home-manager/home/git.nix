{ config, ... }: {
  programs.git = {
    enable = true;
    userName = "Rahmat Ardiansyah";
    userEmail = "rahmatardiansyah147@gmail.com";
    extraConfig = {
      core = { editor = "nvim"; };
      init = { defaultBranch = "main"; };
    };
  };
}

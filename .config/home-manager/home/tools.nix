{ config, ... }: {

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

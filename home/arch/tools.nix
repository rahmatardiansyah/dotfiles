{ config, ... }: {

programs.btop = {
  enable = true;
  settings = {
    color_theme = "onedark";
    theme_background = false;
  };
};
}

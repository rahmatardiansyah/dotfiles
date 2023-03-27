{ config, ... }: {

  xdg.configFile."brave-flags.conf".source = ../.config/brave-flags.conf;

  # disable sound gnome-screenshot
  xdg.dataFile."sounds/__custom/screen-capture.disabled".text = "";

}

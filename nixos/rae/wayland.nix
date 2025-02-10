{
  pkgs,
  inputs,
  ...
}: let
wallpaper = ../../home/common/wayland/wallpaper.png;
in
{

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

#  programs.hyprland = {
#    enable = true;
#    xwayland.enable = true;
#
#    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
#  };

  programs.sway = {
    enable = true;
  };


  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
	theme = "where_is_my_sddm_theme_qt5";
      };
      defaultSession = "sway";
    };
  };

  environment.systemPackages = [
    pkgs.alacritty
    pkgs.bemenu

    (pkgs.where-is-my-sddm-theme.override {
       variants = ["qt5"];
       themeConfig.General = {
	 font = "Noto Sans Mono";
	 hideCursor = false;
	 background = "${wallpaper}";
	 passwordFontSize = 26;
	 passwordCursorColor = "#000000";
     };
     })
  ];
}

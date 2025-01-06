{
  pkgs,
  inputs,
  ...
}: {

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

  environment.systemPackages = [
#   pkgs.kitty
    pkgs.alacritty
    pkgs.bemenu
  ];

  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
#      defaultSession = "hyprland";
      defaultSession = "sway";
    };
  };
}

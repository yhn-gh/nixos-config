{
  pkgs,
  inputs,
  ...
}: {

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;

    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
  };


  environment.systemPackages = [
    pkgs.kitty
  ];

  services = {
    xserver.videoDrivers = [ "nvidia" ];
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };

      defaultSession = "hyprland";
    };
  };
}

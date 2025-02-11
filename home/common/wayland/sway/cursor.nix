{
  pkgs,
  ...
}: {

  home.packages = with pkgs; [
    pkgs.bibata-cursors
  ];

  gtk.enable = true;

  gtk.theme = {
    name = "Adwaita-dark";
    package = pkgs.gnome-themes-extra;
  };

  gtk.cursorTheme = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 20;
  };

  wayland.windowManager.sway = {
    config.startup = [
    { command = "swaymsg seat seat0 xcursor_theme Bibata-Modern-Classic 20"; always = true; }
    ];
  };
}

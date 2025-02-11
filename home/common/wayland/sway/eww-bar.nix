{
  pkgs,
  lib,
  ...
}: {

  wayland.windowManager.sway = {
    config.startup = [
    { command = "${lib.getExe pkgs.eww} open statusbar"; }
    ];
  };
}

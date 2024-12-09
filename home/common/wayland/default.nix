{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./wofi.nix
    ./hyprland.nix
    ./eww.nix
  ];

}

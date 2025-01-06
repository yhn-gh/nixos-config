{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./wofi.nix
    ./sway.nix
    ./eww.nix
  ];

}

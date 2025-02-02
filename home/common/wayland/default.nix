{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./sway.nix
    ./eww.nix
  ];

}

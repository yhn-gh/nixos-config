{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./sway
    ./eww.nix
  ];

}

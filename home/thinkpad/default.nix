{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ../common
    ./packages.nix
  ];

  nixpkgs.config.allowUnfree = true;
}

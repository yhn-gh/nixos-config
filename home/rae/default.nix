{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ../common
  ];

  nixpkgs.config.allowUnfree = true;
}

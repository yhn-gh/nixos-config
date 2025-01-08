{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ../common
    ./packages.nix
    ./ssh.nix
  ];

  nixpkgs.config.allowUnfree = true;
}

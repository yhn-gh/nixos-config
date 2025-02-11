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

  myModules.sway = {
    scaling = "1.3";
  };

  nixpkgs.config.allowUnfree = true;
}

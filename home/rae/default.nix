{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ../common
  ];
  
  myModules.sway = {
    scaling = "1";
  };

  nixpkgs.config.allowUnfree = true;
}

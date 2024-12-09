{
  config,
  lib,
  inputs,
  ...
}: {

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./general.nix
    ./theme.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}

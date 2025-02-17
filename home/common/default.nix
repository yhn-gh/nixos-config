{
  pkgs,
  lib,
  inputs,
  nixvim,
  ...
}: {
  imports = [
    ./dev
    ./wayland
    ./nixvim
    ./firefox.nix
    ./git.nix
    ./yazi.nix
    ./aliases.nix
    ./zellij.nix
    ./alacritty.nix
    ./fontconfig.nix
    ./udiskie.nix
    ./mpv.nix
    ./packages.nix
  ];

  programs = {
    home-manager.enable = true;
    fish.enable = true;
  };

  home = {
    stateVersion = "24.05";

    username = lib.mkDefault "yhn";
    homeDirectory = lib.mkDefault "/home/yhn";

    sessionVariables = {
      EDITOR = "nvim";
    };

  };
}

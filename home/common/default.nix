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
    ./kitty.nix
    ./yazi.nix
    ./aliases.nix
    ./obs.nix
    ./zellij.nix
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

    packages = with pkgs; [
      jq
      fd
      pfetch

      discord
      
      eza

    ];
  };
}

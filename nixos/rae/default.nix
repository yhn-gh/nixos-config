{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware.nix
    ./bootloader.nix
    ../common

    ./disko.nix
    ./wayland.nix
    ./sound.nix

    ./packages.nix
    ./nvidia.nix
    ./steam.nix
    ./avahi.nix
    ./wireguard.nix
  ];

  networking.hostName = "rae";


  system = {
    autoUpgrade.enable = false;

    stateVersion = "24.05";
  };
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}

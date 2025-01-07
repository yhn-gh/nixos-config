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
    ./udev.nix
    ./retroarch.nix
    ./gamescope.nix
    ./xdg-portal-wlr.nix

    ./wireguard

    ./tlp.nix
  ];

  networking.hostName = "thinkpad";
  age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFA2SC2ihTRmTXddq7l27pLYSRQUO0c9XhhLlVXQGOOy";
  age.identityPaths = [ "/home/yhn/.ssh/id_ed25519" ];

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  services.blueman.enable = true;

  system = {
    autoUpgrade.enable = false;

    stateVersion = "24.05";
  };
  

}

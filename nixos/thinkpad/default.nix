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

    ./wireguard.nix

    ./tlp.nix
  ];

  networking.hostName = "thinkpad";

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  services.blueman.enable = true;

  system = {
    autoUpgrade.enable = false;

    stateVersion = "24.05";
  };
  

}

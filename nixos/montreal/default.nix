{
  pkgs,
  inputs,
  ...

}: {
  imports = [
    ./disko.nix
  ];
  networking.hostName = "montreal";

  system = {
    autoUpgrade.enable = false;
    stateVersion = "24.11";
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}

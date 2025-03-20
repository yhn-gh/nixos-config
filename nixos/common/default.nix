{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.disko.nixosModules.disko

    ./users.nix
    ./udisks.nix
    ./fish.nix
    ./packages.nix
    ./syncthing.nix
    ./python.nix
    ./fonts
    ./tmpfiles.nix
    ./sops.nix
 ];

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = "nix-command flakes";
    keep-outputs = true;
    keep-derivations = true;
  };

  
  time.timeZone = "Asia/Seoul";

  environment.variables = {
    EDITOR = "nvim";
  };

  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
    };

    enableIPv6 = false;
    useDHCP = false;
    dhcpcd.enable = false;

    nameservers = [
      "1.1.1.1"
      "9.9.9.9"
    ];

    firewall.enable = true;
  };
}

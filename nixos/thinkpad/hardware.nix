{ config, lib, pkgs, modulesPath, inputs, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-z13-gen1
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  networking.useDHCP = lib.mkDefault true;

  services.fwupd.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

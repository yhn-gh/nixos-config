{
  boot.kernelParams = [
    "pcie_port_pm=off"
    "pcie_aspm.policy=performance"
  ];
  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };
}

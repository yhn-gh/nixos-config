{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    acpi
    light


    bluez

    prismlauncher
 ];
}

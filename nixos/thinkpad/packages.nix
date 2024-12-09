{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    acpi
    light
    zathura
    pandoc
    jellyfin-media-player
    bluez
    prismlauncher
 ];
}

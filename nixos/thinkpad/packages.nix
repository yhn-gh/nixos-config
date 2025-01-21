{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    acpi
    light

    zathura
    pandoc

    bluez

    prismlauncher

    ueberzugpp
    tidal-dl

    grim
    slurp
    satty

    fzf

    wl-clipboard

    mako
    libnotify
 ];
}

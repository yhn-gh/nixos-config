{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    steam
    udiskie
    arduino-cli
    arduino-ide
    kicad
    uxplay
    telegram-desktop
    vesktop
 ];
}

{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    steam
    udiskie
 ];
}

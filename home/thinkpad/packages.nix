{
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs = {
  };

  home = {
    packages = with pkgs; [
      mpv
    ];
  };
}

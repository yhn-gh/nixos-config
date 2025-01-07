{
  pkgs,
  lib,
  ...
} : {
  home = {
    packages = with pkgs; [
      rust-bin.stable.latest.default
    ];
  };
}

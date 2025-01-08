{
  pkgs,
  config,
  inputs,
  ...
}: let
  berkeley-mono = pkgs.callPackage ./berkeley-mono.nix { secrets = inputs.secrets; };
in {

  fonts.packages = with pkgs; [
    berkeley-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.symbols-only
  ];
}

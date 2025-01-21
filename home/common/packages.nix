{
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      fd
      jq
      discord
      eza
    ];
  };
}

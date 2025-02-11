{
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      fd
      gh
      jq
      discord
      eza
    ];
  };
}

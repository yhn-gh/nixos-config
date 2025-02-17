{
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      fd
      gh
      vesktop
      jq
      eza
    ];
  };
}

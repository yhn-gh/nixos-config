{
  pkgs,
  ...
}: {
  programs.nixvim = {
    colorschemes.base16 = {
      enable = true;
      colorscheme = "black-metal";
    };
  };
}

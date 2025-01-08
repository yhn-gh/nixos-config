{
  pkgs,
  ...
}: {
  programs.nixvim = {
    colorschemes.kanagawa = {
      enable = true;
      settings = {
	theme = "dragon";
	background.dark = "dragon";
      };
    };
  };
}

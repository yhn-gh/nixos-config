{
  programs.nixvim = {
    plugins = {
      lsp = {
	enable = true;
      };
      rustaceanvim.enable = true;
      lsp-format = {
	enable = true;
      };
    };
  };
}

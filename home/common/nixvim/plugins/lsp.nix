{
  programs.nixvim = {
    plugins = {
      lsp = {
	enable = true;
	keymaps = {
	  lspBuf = {
	    "<C-c>" = "code_action";
	    "<C-r>" = "rename";
	    "gD" = "definition";
	    "gd" = "declaration";
	    "gi" = "implementation";
	  };
	};
      };
      rustaceanvim.enable = true;
      lsp-format = {
	enable = true;
      };
    };
  };
}

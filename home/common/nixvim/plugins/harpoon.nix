{
  programs.nixvim = {
    plugins = {
      harpoon = {
	enable = true;
	enableTelescope = true;
	keymaps = {
	  toggleQuickMenu = "<leader>q";
	  addFile = "<leader>a";
	  navFile = {
	    "1" = "<C-j>";
	    "2" = "<C-k>";
	    "3" = "<C-l>";
	    "4" = "<C-m>";
	  };
	};
      };
    };
  };
}

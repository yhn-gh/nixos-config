{
  programs.nixvim = {
    plugins = {
      telescope = {
	enable = true;
	extensions = {
	  file-browser.enable = true;
	};
      };
      web-devicons.enable = true;
    };
    keymaps = [
     {
      mode = "n";
      key = "<leader>F";
      action = "<cmd>Telescope file_browser<cr>";
     }
     {
	mode = "n";
	key = "<leader>f";
	action = "<cmd>Telescope find_files<cr>";
      }
    ];
  };
}

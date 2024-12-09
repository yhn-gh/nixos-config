{
  programs.nixvim = {
    plugins = {
      toggleterm = {
	enable = true;
	settings.direction = "tab";
      };
    };

    keymaps = [
      {
	key = "<leader>t";
	action = "<cmd>ToggleTerm <cr>";
	options.nowait = true;
      }
      {
	mode = "t";
	key = "<Esc>";
	action = "<C-\\><C-n><cmd>ToggleTerm <cr>";
	options.nowait = true;
      }
    ];
  };
}

{
  programs.nixvim = {
    keymaps = [
    {
      mode = "n";
      key = "<C-j>";
      action = "<cmd>Neorg toc<CR>";
    }
    ];
    plugins = {

      neorg = {
	enable = true;
	modules = {
	  "core.defaults" = {
	    __empty = null;
	  };
	  "core.concealer" = {
	    __empty = null;
	  };
	  "core.dirman" = {
	    config = {
	      workspaces = {
		home = "~/notes/home";
	      };
	      default_workspace = "home";
	    };
	  };
	};
      };
    };

  };
}

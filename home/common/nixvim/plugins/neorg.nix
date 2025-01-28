{
  programs.nixvim = {
    opts = {
      conceallevel = 2;
      concealcursor = "nc";
    };
    keymaps = [
    {
      mode = "n";
      key = "<localleader>nj";
      action = "<cmd>Neorg journal<CR>";
    }
    {
      mode = "n";
      key = "<localleader>nr";
      action = "<cmd>Neorg return<CR>";
    }
    ];
    plugins = {

      neorg = {
	enable = true;
	settings.load = {
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
		edu = "~/notes/edu";
	      };
	      default_workspace = "home";
	    };
	  };
	};
      };
    };

  };
}

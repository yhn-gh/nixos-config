{
  pkgs,
    ...
}: {
  programs.nixvim = {
    plugins.fzf-lua = {
      enable = true;
      settings = {

	winopts = {
	  row = 1;
	  height = 0.4;
	  width = 1;
	  border = false;
	  preview = {
	    # hidden = "hidden";
	    horizontal = "right:50%";
	    scrollbar = false;
	  };
	};
      };

      keymaps = {
	"<C-f>" = "files";
	"<C-g>" = {
	  action = "live_grep";
	  settings.winopts = {
	    fullscreen = true;
	  };
	};
      };
    };
  };
}

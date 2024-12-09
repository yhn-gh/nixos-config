{
  programs.nixvim = {
    plugins = {
      lualine = {
	enable = true;
	settings = {
	  options = {
	    section_separators = "";
	    component_separators = "";
	  };
	  sections = {
	    lualine_a = [
	      "mode"
	    ];
	    lualine_b = [
	      "filename"
	    ];
	    lualine_c = [
	      ""
	    ];
	    lualine_x = [
	      ""
	    ];
	    lualine_y = [
	      "diagnostics"
	    ];
	    lualine_z = [
	      "branch"
	      "diff"
	    ];
	  };
	};
      };
    };
  };
}

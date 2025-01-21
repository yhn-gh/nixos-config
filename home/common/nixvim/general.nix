{
  config,
  ...
} : {
  programs.nixvim = {
    globals.mapleader = " ";
    globals.localleader = "\\";
    keymaps = [
    {
      mode = ["n" "v"];
      key = "<C-y>";
      action = "\"+y";
    }
    ];
    opts = {
      number = true;
      relativenumber = true;
      clipboard = "unnamedplus";
      
      shiftwidth = 2;

      ignorecase = true;
      smartcase = true;

      signcolumn = "number";

      autoindent = true;
      smartindent = true;

      hlsearch = true;
      incsearch = true;

    };
  };
}

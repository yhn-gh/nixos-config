{
  config,
  ...
} : {
  programs.nixvim = {
    globals.mapleader = " ";
    globals.localleader = "\\";

    opts = {
      number = true;
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

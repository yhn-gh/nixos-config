{
  pkgs,
  ...
}: {
  programs.nixvim = {
    extraPlugins = with pkgs; [
      vimPlugins.fzfWrapper
    ];

    globals = {
      fzf_layout = { down = "20%"; };
    };

    keymaps = [
    {
      mode = "n";
      key = "<C-f>";
      action = "<cmd>FZF<cr>";
    }
    ];
  };
}

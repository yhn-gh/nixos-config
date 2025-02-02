{
  programs.zellij = {
    enable = true;
    settings = {
      # Make zellij UI more compact
      pane_frames = false;
      default_layout = "compact";
      theme = "kanagawa";
      simplified_ui = true;
      keybinds = {
	unbind = [
	  "Ctrl g"
	];
      };
    };
  };
}

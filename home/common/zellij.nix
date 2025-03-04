{
  programs.zellij = {
    enable = true;
# Otherwise it creates a session everytime you open shell which is stupid
    enableFishIntegration = false; 
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

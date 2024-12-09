{
  programs.zellij = {
    enable = true;
    settings = {
      # Make zellij UI more compact
      pane_frames = false;
      default_layout = "compact";
      simplified_ui = true;
    };
  };
}

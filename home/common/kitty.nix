{
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "Berkeley Mono";
      bold_font = "Berkeley Mono Bold";
      bold_italic_font = "Berkeley Mono Bold Italic";
      italic_font = "Berkeley Mono Italic";
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };
    themeFile = "BlackMetal";

  };
}

{
  programs.mpv = {
    enable = true;
    defaultProfiles = [ "subs" ];
    profiles = {
      subs = {
	slang = "en,eng,english";
	ytdl-raw-options="format-sort=\"vcodec:h264,proto\"";
	ytdl-format="bestvideo*[height<=?720][fps<=30]+bestaudio/best";
      };
    };
  };
}

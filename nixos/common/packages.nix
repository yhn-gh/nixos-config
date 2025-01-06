{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
    mako
    libnotify

    wget

    hypridle
    hyprpaper

    openssl

    btop

    gcc

    python3
    uv

    cmake
    ffmpeg-headless
    lazygit
    fastfetch
    anki
 ];
}

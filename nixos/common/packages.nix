{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    uget

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

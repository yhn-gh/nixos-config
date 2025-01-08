{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    sops

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

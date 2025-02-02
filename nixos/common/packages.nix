{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    sops

    openssl

    atop

    gcc

    python3
    uv

    cmake
    ffmpeg-headless
    wf-recorder
    lazygit
    fastfetch
    anki
 ];
}

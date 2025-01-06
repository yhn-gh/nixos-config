{
  services.tlp = {
    enable = true;
    settings = {
      RADEON_DPM_STATE_ON_AC="performance";
      RADEON_DPM_STATE_ON_BAT="battery";

      PLATFORM_PROFILE_ON_AC="performance";
      PLATFORM_PROFILE_ON_BAT="balanced";
    };
  };
}

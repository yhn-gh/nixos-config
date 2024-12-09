{
  services.tlp = {
    enable = true;
    settings = {
      CPU_ENERGY_PERF_POLICY_ON_AC="balance_performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT="power";
      RADEON_DPM_STATE_ON_AC="performance";
      RADEON_DPM_STATE_ON_BAT="battery";

      NMI_WATCHDOG=0;

      PLATFORM_PROFILE_ON_AC="performance";
      PLATFORM_PROFILE_ON_BAT="low-power";

      CPU_SCALING_GOVERNOR_ON_AC="performance";
      CPU_SCALING_GOVERNOR_ON_BAT="powersave";
    };
  };
}
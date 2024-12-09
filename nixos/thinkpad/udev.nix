{
  pkgs,
  lib,
  ...
}: 
let
  lowBatteryNotification = pkgs.writeScript "lowBattery" ''
    export DISPLAY=:0

    batteryPercentage=`${lib.getBin pkgs.acpi}/bin/acpi -b | grep -P -o '[0-9]+(?=%)'`
    batteryStatus=`${lib.getBin pkgs.acpi}/bin/acpi -b | grep -P -o '\w+(?=,)'`

    ${lib.getBin pkgs.libnotify}/bin/notify-send "$(echo battery is $batteryStatus: $batteryPercentage.)"
  '';
  batteryStatusNotification = pkgs.writeScript "batteryStatus" ''
    export DISPLAY=:0

    batteryPercentage=`${lib.getBin pkgs.acpi}/bin/acpi -b | grep -P -o '[0-9]+(?=%)'`
    batteryStatus=`${lib.getBin pkgs.acpi}/bin/acpi -b | grep -P -o '\w+(?=,)'`

    ${lib.getBin pkgs.libnotify}/bin/notify-send "$(echo battery is $batteryStatus: $batteryPercentage.)"
  '';
in {
  services.udev = {
    extraRules = ''
      ACTION=="add", SUBSYSTEM=="backlight", RUN+="${lib.getBin pkgs.coreutils}/bin/chgrp video $sys$devpath/brightness", RUN+="${lib.getBin pkgs.coreutils}/bin/chmod g+w $sys$devpath/brightness"
      SUBSYSTEM=="leds", ACTION=="add", KERNEL=="platform::micmute", ATTR{brightness}="0" 

      ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", RUN+="${batteryStatusNotification}"
    '';
  };
}

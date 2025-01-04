{ config, lib, pkgsUnstable, ... }:
let cfg = config.xsfx;
in {
  options.xsfx.x11 = lib.mkEnableOption "enable x11";

  config.programs.firefox.enable = lib.mkIf cfg.x11 true;

  config.home.packages = with pkgsUnstable;
    lib.mkIf cfg.x11 [
      alacritty
      arandr
      bumblebee-status
      dunst
      google-chrome
      handbrake
      libmediainfo
      makemkv
      mediaelch
      networkmanagerapplet
      pavucontrol
      rofi
      signal-desktop
      slack
      system-config-printer
      unclutter-xfixes
      xdotool
    ];
}

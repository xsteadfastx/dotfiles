{ nixosConfig, lib, pkgsUnstable, ... }:
let cfg = nixosConfig.xsfx;
in {
  programs.firefox.enable = lib.mkIf cfg.x11 true;

  home.packages = with pkgsUnstable;
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

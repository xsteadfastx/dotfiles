{ nixosConfig, lib, pkgsUnstable, pkgsGhostty, ... }:
let cfg = nixosConfig.xsfx;
in {
  programs.firefox.enable = lib.mkIf cfg.x11 true;

  home.packages = with pkgsUnstable;
    lib.mkIf cfg.x11 [
      arandr
      bumblebee-status
      dunst
      evince
      evince
      pkgsGhostty.ghostty
      gimp
      google-chrome
      handbrake
      libmediainfo
      makemkv
      mediaelch
      mpv
      networkmanagerapplet
      pavucontrol
      rofi
      signal-desktop
      slack
      system-config-printer
      xdotool
    ];
}

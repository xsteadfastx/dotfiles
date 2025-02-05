{ nixosConfig, lib, pkgsUnstable, ... }:
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
      ghostty
      gimp
      google-chrome
      handbrake
      libmediainfo
      makemkv
      mediaelch
      mpv
      networkmanagerapplet
      pavucontrol
      quickemu
      rofi
      signal-desktop
      slack
      system-config-printer
      xdotool
    ];
}

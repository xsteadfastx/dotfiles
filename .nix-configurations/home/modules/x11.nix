{ nixosConfig, lib, pkgsUnstable, ... }:
let cfg = nixosConfig.xsfx;
in {
  programs.chromium = lib.mkIf cfg.x11 {
    enable = true;
    package = (pkgsUnstable.chromium.override { enableWideVine = true; });
    commandLineArgs = [ "--enable-features=WebContentsForceDark" ];
    extensions = [
      { id = "gfapcejdoghpoidkfodoiiffaaibpaem"; } # dracula
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # vimium
      { id = "fihnjjcciajhdojfnbdddfaoknhalnja"; } # i dont care about cookies
    ];
  };

  home.packages = with pkgsUnstable;
    lib.mkIf cfg.x11 [
      arandr
      bumblebee-status
      dunst
      evince
      evince
      flameshot
      ghostty
      gimp
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
      tor-browser-bundle-bin
      xdotool
    ];
}

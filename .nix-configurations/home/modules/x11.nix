{ pkgsUnstable, ... }: {
  home.packages = with pkgsUnstable; [
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

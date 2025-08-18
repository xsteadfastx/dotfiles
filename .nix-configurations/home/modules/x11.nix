{
  nixosConfig,
  lib,
  pkgs,
  pkgsUnstable,
  ...
}:
let
  cfg = nixosConfig.xsfx;
in
{
  # programs.chromium = lib.mkIf cfg.x11 {
  #   enable = true;
  #   package = (pkgsUnstable.chromium.override { enableWideVine = true; });
  #   commandLineArgs = [
  #     "--enable-features=WebContentsForceDark:inversion_method/cielab_based/image_behavior/selective/text_lightness_threshold/150/background_lightness_threshold/205"
  #   ];
  #   extensions = [
  #     { id = "gfapcejdoghpoidkfodoiiffaaibpaem"; } # dracula
  #     # { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock
  #     { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # ublock origin lite
  #     { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # vimium
  #     { id = "fihnjjcciajhdojfnbdddfaoknhalnja"; } # i dont care about cookies
  #     { id = "dhdgffkkebhmkfjojejmpbldmpobfkfo"; } # tampermonkey
  #   ];
  # };

  # home.file.".mozilla/firefox/default/chrome" = {
  #   source = "${
  #     builtins.fetchGit {
  #       url = "https://github.com/dracula/firefox";
  #       rev = "1eb2e1285e819d71023dd094ec3b175d732caf98";
  #     }
  #   }/userChrome/chrome";
  #   recursive = true;
  # };

  programs.firefox = lib.mkIf cfg.x11 {
    enable = true;
    policies = {
      DefaultDownloadDirectory = "~/tmp";
      DisableAccounts = false;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "never";
      DontCheckDefaultBrowser = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      FirefoxHome = {
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        SponsoredTopSites = false;
        TopSites = false;
      };
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      Preferences = {
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.topsites.contile.enabled" = false;
        "extensions.pocket.enabled" = false;
      };
    };
    profiles.default = {
      settings = {
        "browser.aboutConfig.showWarning" = false;
        "browser.compactmode.show" = true;
        "extensions.autoDisableScopes" = 0;
        "signon.rememberSignons" = false;
        # "browser.tabs.tabClipWidth" = 86;
        # "browser.tabs.tabMinWidth" = 66;
        # "browser.tabs.tabmanager.enabled" = false;
        # "layout.css.color-mix.enabled" = true;
        # "svg.context-properties.content.enabled" = true;
        # "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      extensions.packages = with pkgsUnstable.firefox-addons; [
        darkreader
        dracula-dark-colorscheme
        greasemonkey
        i-dont-care-about-cookies
        ublock-origin
        vimium
      ];
    };
  };

  home.packages =
    with pkgsUnstable;
    lib.mkIf cfg.x11 [
      # beekeeper-studio # sql
      # quickemu
      arandr
      bumblebee-status
      dunst
      evince
      flameshot
      ghostty
      gimp
      handbrake
      libmediainfo
      makemkv
      mediaelch
      mpv
      mqttx
      networkmanagerapplet
      pavucontrol
      pcmanfm
      pkgs.calibre
      rawtherapee
      remmina
      rofi
      rustdesk
      signal-desktop
      slack
      system-config-printer
      tor-browser-bundle-bin
      xdotool
      xsaneGimp

      (lib.mkIf cfg.work _1password-cli)
      (lib.mkIf cfg.work _1password-gui)
    ];
}

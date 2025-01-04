{ ... }: {
  imports = [ modules/base.nix modules/neovim.nix modules/x11.nix ];

  home.username = "marv";
  home.homeDirectory = "/home/marv";

  home.stateVersion = "24.05";

  xsfx.neovim = true;
  xsfx.x11 = true;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Direnv
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}


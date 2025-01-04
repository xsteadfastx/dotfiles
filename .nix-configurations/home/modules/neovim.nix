{ config, lib, pkgsUnstable, ... }:
let cfg = config.xsfx;
in {
  options.xsfx.neovim = lib.mkEnableOption "enable neovim";

  config.home.packages = with pkgsUnstable;
    lib.mkIf cfg.neovim [
      neovim

      # formatter
      nixfmt-classic
      nodePackages.prettier
      shfmt
      sql-formatter

      # lsp
      gopls
      lua-language-server
      nil
      vscode-langservers-extracted
      yaml-language-server

      # lint
      shellcheck
    ];
}

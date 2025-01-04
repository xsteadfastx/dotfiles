{ nixosConfig, lib, pkgsUnstable, ... }:
let cfg = nixosConfig.xsfx;
in {
  home.packages = with pkgsUnstable;
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

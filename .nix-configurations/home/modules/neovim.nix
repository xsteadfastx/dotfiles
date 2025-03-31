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
  home.packages =
    with pkgsUnstable;
    lib.mkIf cfg.neovim [
      neovim

      # formatter
      black
      clang-tools
      golines
      hclfmt
      nixfmt-rfc-style
      nodePackages.prettier
      shfmt
      sql-formatter
      stylua
      yamlfmt

      # lsp
      pkgs.golangci-lint-langserver
      gopls
      lua-language-server
      nil
      python312Packages.python-lsp-server
      vscode-langservers-extracted
      yaml-language-server

      # lint
      markdownlint-cli
      shellcheck
      sqlfluff
    ];
}

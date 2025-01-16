{ nixosConfig, lib, pkgsUnstable, ... }:
let cfg = nixosConfig.xsfx;
in {
  home.packages = with pkgsUnstable;
    lib.mkIf cfg.neovim [
      neovim

      # formatter
      black
      clang-tools
      golines
      hclfmt
      nixfmt-classic
      nodePackages.prettier
      shfmt
      sql-formatter
      stylua
      yamlfmt

      # lsp
      golangci-lint-langserver
      gopls
      lua-language-server
      nil
      vscode-langservers-extracted
      yaml-language-server

      # lint
      shellcheck
    ];
}

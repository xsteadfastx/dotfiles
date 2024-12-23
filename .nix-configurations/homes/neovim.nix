{ pkgsUnstable, ... }: {

  home.packages = with pkgsUnstable; [
    neovim
    # formatter
    nixfmt-classic
    nodePackages.prettier
    shfmt
    sql-formatter

    # lsp
    nil
    gopls
    vscode-langservers-extracted
    lua-language-server
  ];
}

{ pkgsUnstable, ... }: {

  home.packages = with pkgsUnstable; [
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
  ];
}

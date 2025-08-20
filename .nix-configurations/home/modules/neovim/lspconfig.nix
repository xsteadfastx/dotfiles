{
  pkgs,
  pkgsUnstable,
  nixosConfig,
  lib,
  ...
}:
let
  cfg = nixosConfig.xsfx;

  inherit (lib) mkIf;
in
{
  programs.neovim = mkIf cfg.neovim {
    extraPackages = with pkgsUnstable; [
      pkgs.golangci-lint-langserver
      gopls
      lua-language-server
      nil
      python312Packages.python-lsp-server
      vscode-langservers-extracted
      yaml-language-server
    ];
    plugins = with pkgsUnstable.vimPlugins; [
      SchemaStore-nvim
      cmp-nvim-lsp
      nvim-lspconfig
    ];
    extraLuaConfig = ''
      -- lsp configuration
      lspconfig = require("lspconfig")

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.lua_ls.setup({})

      lspconfig.nil_ls.setup({
        capabilities = capabilities,
        settings = {
          ["nil"] = {
            formatting = {
              command = { "nixfmt" },
            },
          },
        },
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
        settings = {
          gopls = {
            gofumpt = true,
          },
        },
      })

      lspconfig.golangci_lint_ls.setup({
        -- init_options = {
        --  command = { "golangci-lint", "run", "--out-format", "json" },
        -- },
      })

      lspconfig.jsonls.setup({
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      lspconfig.yamlls.setup({
        capabilities = capabilities,
        settings = {
          schemaStore = {
            enable = false,
            url = "",
          },
          yaml = {
            schemas = require("schemastore").yaml.schemas(),
            keyOrdering = false,
          },
        },
        filetypes = { "yaml", "yaml.docker-compose", "taskfile" },
      })

      lspconfig.pylsp.setup({})

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
      })

      -- vim.diagnostic.config({ virtual_text = true })

      vim.keymap.set("n", "<Leader>ho", "<cmd>lua vim.lsp.buf.hover({border = 'single'})<CR>")
      vim.keymap.set("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
      vim.keymap.set("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>" )
    '';
  };
}

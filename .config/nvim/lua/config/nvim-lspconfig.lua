local mason = require("mason")
mason.setup({})

-- lsp configuration
local msonlsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

msonlsp.setup({
  {
    ensure_installed = {
      "ansiblels",
      "cmake",
      "dockerls",
      "eslint",
      "flux_lsp",
      "golangci_lint_ls",
      "gopls",
      "html",
      "jsonls",
      "marksman",
      "sqlls",
      "sqls",
      "sumneko_lua",
      "taplo",
      "tflint",
      "tsserver",
      "vimls",
      "yamlls",
    },
  },
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

msonlsp.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities
    })
  end,
  ["gopls"] = function()
    lspconfig.gopls.setup({
      capabilities = capabilities,
      init_options = {
        buildFlags = { "-tags=integration,tools" },
        gofumpt = true,
      },
    })
  end,
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
  ["jsonls"] = function()
    lspconfig.jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })
  end,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
})

-- install the other mason
require("mason-tool-installer").setup({
  run_on_start = true,
  start_delay = 3000,
  ensure_installed = {
    "clang-format",
    "go-debug-adapter",
    "gofumpt",
    "goimports",
    "golines",
    "gopls",
    "tflint",
    "sql-formatter",
    "stylua",
    "prettier",
    "shfmt",
    "hadolint",
  },
})

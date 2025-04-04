-- install and manage LSP servers, DAP servers, linters, and formatters
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		lazy = false, -- needed, else its not working at all!
		keys = {
			{ "<Leader>ho", "<cmd>lua vim.lsp.buf.hover({border = 'single'})<CR>" },
			{ "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>" },
			{ "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>" },
		},
		config = function()
			-- neodev
			require("lazydev").setup({})

			-- lsp configuration
			local lspconfig = require("lspconfig")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
				init_options = {
					command = { "golangci-lint", "run", "--out-format", "json" },
				},
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
		end,
	},
}

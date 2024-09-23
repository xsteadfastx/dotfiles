-- install and manage LSP servers, DAP servers, linters, and formatters
return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"hrsh7th/nvim-cmp",
			"neovim/nvim-lspconfig",
		},
		lazy = false, -- needed, else its not working at all!
		keys = {
			{ "<Leader>ho", "<cmd>lua vim.lsp.buf.hover()<CR>" },
			{ "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>" },
			{ "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>" },
		},
		config = function()
			local mason = require("mason")
			mason.setup({ ui = { border = "single" } })

			-- neodev
			require("neodev").setup({})

			-- lsp configuration
			local msonlsp = require("mason-lspconfig")
			local lspconfig = require("lspconfig")

			-- the rest
			msonlsp.setup({
				{
					ensure_installed = {
						"ansiblels",
						"bash-language-server",
						"buf-language-server",
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
						"sumneko_lua",
						"taplo",
						"tflint",
						"vimls",
						"yamlfmt",
						"yamlls",
					},
				},
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			msonlsp.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
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

				["yamlls"] = function()
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
					"buf",
					"clang-format",
					"go-debug-adapter",
					"gofumpt",
					"goimports",
					"golines",
					"gopls",
					"hadolint",
					"markdownlint",
					"prettier",
					"shfmt",
					"sql-formatter",
					"stylua",
					"tflint",
				},
			})
		end,
	},
}

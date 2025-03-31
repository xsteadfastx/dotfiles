-- format runner
local api = vim.api
local group = api.nvim_create_augroup("format", { clear = true })

api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
	group = group,
})

return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").formatters.clang_format = {
				prepend_args = {
					"-style={BasedOnStyle: Google, IndentWidth: 4, AlignConsecutiveDeclarations: true, AlignConsecutiveAssignments: true, ColumnLimit: 0}",
				},
			}

			require("conform").formatters.golines = {
				prepend_args = { "--base-formatter=gofumpt" },
			}

			require("conform").formatters.injected = {
				options = {
					ignore_errors = false,
				},
			}

			require("conform").setup({
				formatters_by_ft = {
					go = { "golines" },
					hcl = { "hcl" },
					js = { "prettier" },
					lua = { "stylua" },
					markdown = { "prettier" },
					proto = { "clang_format" },
					python = { "black" },
					sh = { "shfmt" },
					sql = { "sqlfluff" },
					taskfile = { "prettier" },
					yaml = { "yamlfmt" },
				},

				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 50000,
				},
			})
		end,
	},
}

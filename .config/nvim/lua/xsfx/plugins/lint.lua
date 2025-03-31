-- an asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support
return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")

			lint.linters.sqlfluff.args = {
				"lint",
				"--format=json",
				"--dialect=postgres",
			}

			lint.linters_by_ft = {
				sh = { "shellcheck" },
				ansible = { "ansible_lint" },
				dockerfile = { "hadolint" },
				markdown = { "markdownlint" },
				sql = { "sqlfluff" },
			}

			local api = vim.api
			local group = api.nvim_create_augroup("lint", { clear = true })

			api.nvim_create_autocmd("BufWritePost", {
				pattern = "*",
				callback = function()
					require("lint").try_lint()
				end,
				group = group,
			})
		end,
	},
}

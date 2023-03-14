-- an asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support
return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				sh = { "shellcheck" },
				ansible = { "ansible_lint" },
				dockerfile = { "hadolint" },
				markdown = { "markdownlint" },
			}

			require("xsfx.helpers").create_augroups({
				lint = {
					{
						"BufWritePost",
						{
							pattern = "*",
							callback = function()
								require("lint").try_lint()
							end,
						},
					},
				},
			})
		end,
	},
}

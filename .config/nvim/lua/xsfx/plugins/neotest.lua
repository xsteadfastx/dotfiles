-- an extensible framework for interacting with tests within NeoVim
return {
	{
		"rcarriga/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"akinsho/neotest-go",
		},
		keys = {
			{ "<Leader>ntf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>" },
			{ "<Leader>ntn", ":lua require('neotest').run.run()<CR>" },
			{ "<Leader>nto", ":lua require('neotest').output.open()<CR>" },
			{ "<Leader>nts", ":lua require('neotest').summary.open()<CR>" },
		},
		config = function()
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
								diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)
			require("neotest").setup({
				adapters = {
					require("neotest-go"),
				},
			})
		end,
	},
}

-- format runner
local api = vim.api
local group = api.nvim_create_augroup("format", { clear = true })

api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function()
		vim.cmd("FormatWrite")
	end,
	group = group,
})

return {
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				filetype = {
					go = {
						function()
							return {
								exe = "golines",
								args = { "--base-formatter=gofumpt" },
								stdin = true,
							}
						end,
					},
					proto = {
						function()
							return {
								exe = "clang-format",
								args = {
									"-style='{BasedOnStyle: Google, IndentWidth: 4, AlignConsecutiveDeclarations: true, AlignConsecutiveAssignments: true, ColumnLimit: 0}'",
								},
								stdin = true,
							}
						end,
					},
					sql = {
						function()
							return {
								exe = "sql-formatter",
								args = { "-l", "postgresql" },
								stdin = true,
							}
						end,
					},
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					yaml = {
						require("formatter.filetypes.yaml").yamlfmt,
					},
					taskfile = {
						require("formatter.filetypes.yaml").prettier,
					},
					sh = {
						require("formatter.filetypes.sh").shfmt,
					},
					markdown = {
						function()
							return {
								exe = "prettier",
								args = {
									"--stdin-filepath",
									vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
									"--single-quote",
								},
								stdin = true,
							}
						end,
					},
					json = {
						function()
							return {
								exe = "prettier",
								args = {
									"--stdin-filepath",
									vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
									"--single-quote",
								},
								stdin = true,
							}
						end,
					},
					javascript = {
						function()
							return {
								exe = "prettier",
								args = {
									"--stdin-filepath",
									vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
								},
								stdin = true,
							}
						end,
					},
				},
			})
		end,
	},
}

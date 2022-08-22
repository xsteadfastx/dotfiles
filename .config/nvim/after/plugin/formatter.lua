require("xsfx.helpers").create_augroups({ format = { { "BufWritePost", "*", "FormatWrite" } } })

local util = require("formatter.util")

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
					args = { "-u", "-l", "postgresql" },
					stdin = true,
				}
			end,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		yaml = {
			-- function()
			-- 	return {
			-- 		exe = "yq",
			-- 		args = {
			-- 			'"sort_keys(..)"',
			-- 			"-P"
			-- 		},
			-- 		stdin = true
			-- 	}
			-- end,
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--single-quote",
					},
					stdin = true,
				}
			end,
			function()
				return {
					exe = "kustomize cfg fmt",
					stdin = true,
				}
			end,
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
						"--single-quote",
					},
					stdin = true,
				}
			end,
		},
	},
})

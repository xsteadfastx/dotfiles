require("formatter").setup {
	filetype = {
		proto = {
			function()
				return {
					exe = "clang-format",
					stdin = true
				}
			end
		},
		sql = {
			function()
				return {
					exe = "npx sql-formatter",
					args = { "-u", "-l", "postgresql" },
					stdin = true
				}
			end
		},
		lua = {
			function()
				return {
					exe = "npx lua-fmt",
					args = { "-w", "stdout", "--stdin", "--indent-count", 2 },
					stdin = true
				}
			end
		},
		yaml = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						"--single-quote"
					},
					stdin = true
				}
			end,
			function()
				return {
					exe = "kustomize cfg fmt",
					stdin = true
				}
			end
		},
		sh = {
			function()
				return {
					exe = "shfmt",
					args = { "-i", 0 },
					stdin = true
				}
			end
		},
		markdown = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						"--single-quote"
					},
					stdin = true
				}
			end
		},
		json = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						"--single-quote"
					},
					stdin = true
				}
			end
		}
	}
}

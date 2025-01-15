vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "/dev/shm/gopass.*",
	callback = function()
		vim.cmd("setlocal noswapfile nobackup noundofile")
	end,
	group = vim.api.nvim_create_augroup("gopass", { clear = true }),
})

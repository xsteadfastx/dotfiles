local api = vim.api
local group = api.nvim_create_augroup("folding", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
	pattern = "*",
	callback = function()
		vim.cmd("normal zR")
	end,
	group = group,
})

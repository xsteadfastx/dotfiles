local api = vim.api
local group = api.nvim_create_augroup("javascript", { clear = true })

api.nvim_create_autocmd("Filetype", {
	pattern = "javascript",
	callback = function()
		vim.cmd("setl tabstop=2 expandtab shiftwidth=2 softtabstop=2")
	end,
	group = group,
})

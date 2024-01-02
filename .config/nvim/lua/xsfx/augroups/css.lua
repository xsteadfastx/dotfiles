local api = vim.api
local group = api.nvim_create_augroup("css", { clear = true })

api.nvim_create_autocmd("Filetype", {
	pattern = "css",
	callback = function()
		vim.cmd("setl tabstop=2 expandtab shiftwidth=2 softtabstop=2")
		vim.cmd("ColorHighlight")
	end,
	group = group,
})

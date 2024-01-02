local api = vim.api
local group = api.nvim_create_augroup("taskfile", { clear = true })

api.nvim_create_autocmd("Filetype", {
	pattern = "taskfile",
	callback = function()
		vim.cmd("syntax on")
		vim.cmd("setl tabstop=2 expandtab shiftwidth=2 softtabstop=2 syntax=yaml")
	end,
	group = group,
})

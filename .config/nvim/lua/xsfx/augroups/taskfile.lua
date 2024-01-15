local api = vim.api
local group = api.nvim_create_augroup("taskfile", { clear = true })

-- needed because of https://github.com/neovim/neovim/issues/7367
vim.cmd("syntax on")

api.nvim_create_autocmd("Filetype", {
	pattern = "taskfile",
	callback = function()
		vim.cmd("setl tabstop=2 expandtab shiftwidth=2 softtabstop=2 syntax=yaml")
	end,
	group = group,
})

local api = vim.api
local group = api.nvim_create_augroup("html", { clear = true })

api.nvim_create_autocmd("Filetype", {
	pattern = "html,htmldjango",
	callback = function()
		vim.cmd("setl sw=2 ts=2 sts=2")
	end,
	group = group,
})

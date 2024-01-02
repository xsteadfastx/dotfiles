local api = vim.api
local group = api.nvim_create_augroup("tex", { clear = true })

api.nvim_create_autocmd("Filetype", {
	pattern = "tex",
	callback = function()
		vim.cmd("call pencil#init()")
		vim.cmd("setl tabstop=4 expandtab shiftwidth=4 softtabstop=4")
	end,
	group = group,
})

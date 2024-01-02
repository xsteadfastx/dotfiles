local api = vim.api
local group = api.nvim_create_augroup("markdown", { clear = true })

api.nvim_create_autocmd("Filetype", {
	pattern = "markdown,mkd",
	callback = function()
		vim.cmd("call pencil#init()")
		vim.cmd("setl tabstop=4 expandtab shiftwidth=4 softtabstop=4")
		vim.cmd("setl syntax=off")
	end,
	group = group,
})

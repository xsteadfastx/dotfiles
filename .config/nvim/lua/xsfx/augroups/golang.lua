local api = vim.api
local group = api.nvim_create_augroup("go", { clear = true })

api.nvim_create_autocmd("Filetype", {
	pattern = "go",
	callback = function()
		vim.cmd("setl noexpandtab tabstop=4 shiftwidth=4 softtabstop=4")
	end,
	group = group,
})

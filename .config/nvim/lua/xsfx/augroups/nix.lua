local api = vim.api
local group = api.nvim_create_augroup("nix", { clear = true })

api.nvim_create_autocmd("Filetype", {
	pattern = "nix",
	callback = function()
		vim.cmd("setl expandtab tabstop=2 shiftwidth=2 softtabstop=2")
	end,
	group = group,
})

vim.g["vimwiki_list"] = { { path = "~/permanent/vimwiki/", syntax = "markdown", ext = ".md", index = "Home" } }
vim.g["vimwiki_global_ext"] = 0

return {
	-- personal wiki for vim
	{
		"vimwiki/vimwiki",
		config = function()
			local api = vim.api
			local group = api.nvim_create_augroup("wiki", { clear = true })

			api.nvim_create_autocmd("Filetype", {
				pattern = "vimwiki",
				callback = function()
					vim.cmd("call pencil#init()")
					vim.cmd("setl tabstop=4 expandtab shiftwidth=4 softtabstop=4")
				end,
				group = group,
			})
		end,
	},
}

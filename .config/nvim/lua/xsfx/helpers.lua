local api = vim.api

local M = {}

function M.map(mode, lhs, rhs, opts) -- adding keymaps
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M

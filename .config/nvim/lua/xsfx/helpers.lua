local api = vim.api

local M = {}

function M.map(mode, lhs, rhs, opts) -- adding keymaps
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	api.nvim_set_keymap(mode, lhs, rhs, options)
end

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

function M.create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		augroup(group_name, { clear = true })
		for _, def in pairs(definition) do
			def[2]["group"] = group_name
			autocmd(def[1], def[2])
		end
	end
end

return M

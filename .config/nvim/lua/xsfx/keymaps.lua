local g = vim.g -- a table to access global variables
local map = require("xsfx.helpers").map

g.mapleader = " "
g.maplocalleader = "\\"

map("", "<Up>", "<Nop>")
map("", "<Down>", "<Nop>")
map("", "<Left>", "<Nop>")
map("", "<Right>", "<Nop>")

-- center line
-- map("n", "j", "jzz")
-- map("n", "k", "kzz")

-- fixes some strange arrow errors in insert mode
map("i", "^[OA", "<ESC>kli")
map("i", "^[OB", "<ESC>jli")
map("i", "^[OC", "<ESC>lli")
map("i", "^[OD", "<ESC>hli")

-- better indentation
map("v", "<", "<gv")
map("v", ">", ">gv")

-- force tab
map("i", "<S-Tab>", "<C-V><Tab>")

-- buffers
-- should be delivered through barbar or moll/vim-bbye
map("n", "<A-,>", ":TablineBufferPrevious<CR>")
map("n", "<A-.>", ":TablineBufferNext<CR>")
map("n", "<A-c>", ":bd<CR>")

-- terminal mode
map("t", "<Leader><Esc>", "<C-\\><C-n>")

-- dap
map("n", "<Leader>dt", ":lua require('dap-go').debug_test()<CR>")
map("n", "<F5>", ":lua require'dap'.continue()<CR>")
map("n", "<F10>", ":lua require'dap'.step_over()<CR>")
map("n", "<F11>", ":lua require'dap'.step_into()<CR>")
map("n", "<F12>", ":lua require'dap'.step_out()<CR>")
map("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
map("n", "<Leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')<CR>")
map("n", "<Leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
map("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>")
map("n", "<Leader>dl", ":lua require'dap'.run_last()<CR>")
map("n", "<Leader>db", ":lua require('fzf-lua').dap_breakpoints()<CR>")
map("n", "<Leader>dv", ":lua require('fzf-lua').dap_variables()<CR>")
map("n", "<Leader>df", ":lua require('fzf-lua').dap_frames()<CR>")
map("n", "<Leader>dui", ":lua require('dapui').toggle()<CR>")

-- neotest
map("n", "<Leader>ntf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>")
map("n", "<Leader>ntn", ":lua require('neotest').run.run()<CR>")
map("n", "<Leader>nto", ":lua require('neotest').output.open()<CR>")
map("n", "<Leader>nts", ":lua require('neotest').summary.open()<CR>")

-- luasnip
vim.keymap.set({ "i", "s" }, "<C-k>", function()
	local ls = require("luasnip")
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end)

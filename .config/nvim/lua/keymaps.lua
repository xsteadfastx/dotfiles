local g = vim.g -- a table to access global variables
local map = require("helpers").map

g.mapleader = ","
g.maplocalleader = "\\"

map("", "<Up>", "<Nop>")
map("", "<Down>", "<Nop>")
map("", "<Left>", "<Nop>")
map("", "<Right>", "<Nop>")

-- center line
map("n", "j", "jzz")
map("n", "k", "kzz")

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

-- lsp
map("n", "<Leader>ho", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<Leader>fr", "<cmd>lua require('fzf-lua').lsp_references()<CR>")
map("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")

-- fzf
map("n", ";", "<cmd>lua require('fzf-lua').buffers()<CR>")
map("n", "<Leader>ff", "<cmd>lua require('fzf-lua').files()<CR>")
map("n", "<Leader>rg", "<cmd>lua require('fzf-lua').grep_project()<CR>")
map("n", "<Leader>ll", "<cmd>lua require('fzf-lua').grep_curbuf()<CR>")
map("n", "<Leader>cm", "<cmd>lua require('fzf-lua').git_commits()<CR>")
map("n", "<Leader>cf", "<cmd>lua require('fzf-lua').git_bcommits()<CR>")

-- buffers
-- should be delivered through barbar or moll/vim-bbye
map("n", "<A-,>", ":BufferPrevious<CR>")
map("n", "<A-.>", ":BufferNext<CR>")
map("n", "<A-c>", ":BufferDelete<CR>") -- else map it to :bd

-- terminal mode
map("t", "<Leader><Esc>", "<C-\\><C-n>")

-- trouble
map("n", "<C-t>", "<cmd>TroubleToggle<CR>")

-- vimux
map("n", "<Leader>mt", ':call VimuxRunCommand("clear; make test")<CR>')
map("n", "<Leader>ml", ':call VimuxRunCommand("clear; make lint")<CR>')
map("n", "<Leader>vp", ":VimuxPromptCommand<CR>")
map("n", "<Leader>va", ":VimuxRunLastCommand<CR>")
map("n", "<Leader>vq", ":VimuxCloseRunner<CR>")
map("n", "<Leader>vo", ":VimuxOpenRunner<CR>")

-- dap
map("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
map("n", "<F5>", ":lua require'dap'.continue()<CR>")
map("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>")
map("n", "<Leader>dt", ":lua require('dap-go').debug_test()<CR>")
map("n", "<Leader>dc", ":lua require('fzf-lua').dap_commands()<CR>")
map("n", "<Leader>db", ":lua require('fzf-lua').dap_breakpoints()<CR>")
map("n", "<Leader>dv", ":lua require('fzf-lua').dap_variables()<CR>")
map("n", "<Leader>df", ":lua require('fzf-lua').dap_frames()<CR>")

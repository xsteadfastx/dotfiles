local g = vim.g -- a table to access global variables
local map = require("xsfx.helpers").map

g.mapleader = ","
g.maplocalleader = "\\"

map("", "<Up>", "<Nop>")
map("", "<Down>", "<Nop>")
map("", "<Left>", "<Nop>")
map("", "<Right>", "<Nop>")

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
map("n", "<Leader>:", "<cmd>lua require('fzf-lua').commands()<CR>")

-- buffers
-- should be delivered through barbar or moll/vim-bbye
map("n", "<A-,>", ":TablineBufferPrevious<CR>")
map("n", "<A-.>", ":TablineBufferNext<CR>")
map("n", "<A-c>", ":bd<CR>")

-- terminal mode
map("t", "<Leader><Esc>", "<C-\\><C-n>")

-- trouble
map("n", "<C-t>", "<cmd>TroubleToggle<CR>")

-- vimux
map("n", "<Leader>mt", ':call VimuxRunCommand("clear; task test")<CR>')
map("n", "<Leader>ml", ':call VimuxRunCommand("clear; task lint")<CR>')
map("n", "<Leader>mtv", ':call VimuxRunCommand("clear; task tidy")<CR>')
map("n", "<Leader>vp", ":VimuxPromptCommand<CR>")
map("n", "<Leader>va", ":VimuxRunLastCommand<CR>")
map("n", "<Leader>vq", ":VimuxCloseRunner<CR>")
map("n", "<Leader>vo", ":VimuxOpenRunner<CR>")
map("n", "<Leader>vz", ":VimuxZoomRunner<CR>")

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

-- go-vim
map("n", "<Leader>gc", ":GoCoverageToggle<CR>")
map("n", "<Leader>grn", ":GoRename<CR>")
map("n", "<Leader>gie", ":GoIfErr<CR>")

-- neotest
map("n", "<Leader>ntf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>")
map("n", "<Leader>nto", ":lua require('neotest').output.open()<CR>")
map("n", "<Leader>nts", ":lua require('neotest').summary.open()<CR>")

local opt = vim.opt -- to set options
local cmd = vim.cmd -- to execute vim commands e.g. cmd('pwd')

cmd "set clipboard+=unnamedplus" -- needed for neovim copy paste
opt.hidden = true

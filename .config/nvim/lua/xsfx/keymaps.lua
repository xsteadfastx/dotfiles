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

-- HELPERS --------------------------------------
local cmd = vim.cmd -- to execute vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options
local api = vim.api

local function map(mode, lhs, rhs, opts) -- adding keymaps
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        api.nvim_command("augroup " .. group_name)
        api.nvim_command("autocmd!")
        for _, def in ipairs(definition) do
            -- if type(def) == 'table' and type(def[#def]) == 'function' then
            -- 	def[#def] = lua_callback(def[#def])
            -- end
            local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
            api.nvim_command(command)
        end
        api.nvim_command("augroup END")
    end
end

-- OPTIONS --------------------------------------
cmd "set clipboard+=unnamedplus"
opt.completeopt = "menu,menuone,noselect"

-- PLUGINS --------------------------------------
-- bootstrapping paq
local install_path = fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", install_path})
end

require("paq") {
    "savq/paq-nvim",
    "Mofiqul/dracula.nvim",
    "ConradIrwin/vim-bracketed-paste",
    "chrisbra/Colorizer", -- color hex codes and color names
    "cohama/lexima.vim", -- auto close parentheses
    "nvim-lualine/lualine.nvim",
    "ryanoasis/vim-devicons", -- nerd fonts in vim
    "mattn/gist-vim",
    "ntpeters/vim-better-whitespace",
    "reedes/vim-pencil",
    "tpope/vim-surround",
    "vimwiki/vimwiki",
    "sheerun/vim-polyglot",
    "chrisbra/unicode.vim",
    "chrisbra/csv.vim",
    "lukas-reineke/indent-blankline.nvim",
    "nvim-lua/plenary.nvim", -- needed for telescope and gitsigns
    "nvim-telescope/telescope.nvim",
    "lewis6991/gitsigns.nvim",
    "tpope/vim-commentary",
    "chazy/dirsettings",
    "mattn/webapi-vim", -- talk to apis
    "dhruvasagar/vim-table-mode",
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
    {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-emoji",
    "hrsh7th/nvim-cmp",
    "kyazdani42/nvim-web-devicons",
    "romgrk/barbar.nvim",
    "folke/zen-mode.nvim",
    "folke/twilight.nvim",
    "mfussenegger/nvim-lint",
    "lukas-reineke/format.nvim",
    "folke/trouble.nvim"
}

-- UI -------------------------------------------
opt.number = true
opt.relativenumber = true
opt.backspace = "2"
opt.laststatus = 2
opt.synmaxcol = 120

-- opt.listchars:append({eol = "↵"})
opt.listchars:append({trail = "-"})
opt.listchars:append({nbsp = "+"})
opt.listchars:append({extends = ">"})
opt.listchars:append({precedes = "<"})

opt.background = "dark"
opt.list = true
-- opt.cursorline = true -- mark current line
opt.termguicolors = true
opt.foldenable = false
opt.foldmethod = "syntax"
cmd "colorscheme dracula"
cmd "highlight Comment cterm=italic gui=italic"

-- TEXTFORMAT -----------------------------------
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

-- KEYMAPS --------------------------------------
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
map("n", "<Leader>gd", "<cmd>Telescope lsp_definitions<CR>")
map("n", "<Leader>fr", "<cmd>Telescope lsp_references<CR>")

-- telescope
map("n", ";", "<cmd>Telescope buffers<CR>")
map("n", "<Leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<Leader>bb", "<cmd>Telescope buffers<CR>")
map("n", "<Leader>rg", "<cmd>Telescope live_grep<CR>")
map("n", "<Leader>ll", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
map("n", "<Leader>le", "<cmd>Telescope lsp_workspace_diagnostics<CR>")

-- PYTHON ---------------------------------------
nvim_create_augroups(
    {
        python = {
            {"BufRead,BufNewFile", "*.xsh", "set filetype=python"},
            {"FileType", "python", "colorcolumn=88"}
        }
    }
)

-- HTML -----------------------------------------
nvim_create_augroups(
    {
        html = {
            {"FileType", "html", "setl sw=2 ts=2 sts=2"},
            {"FileType", "htmldjango", "setl sw=2 ts=2 sts=2"}
        }
    }
)

-- CSS ------------------------------------------
nvim_create_augroups(
    {
        css = {
            {"BufRead,BufNewFile", "*.scss", "filetype=css"},
            {"FileType", "css", "setl tabstop=2 expandtab shiftwidth=2 softtabstop=2"},
            {"FileType", "css", "ColorHighlight"}
        }
    }
)

-- JAVASCRIPT -----------------------------------
nvim_create_augroups({javascript = {{"FileType", "javascript", "setl tabstop=2 expandtab shiftwidth=2 softtabstop=2"}}})

-- GOLANG ---------------------------------------
nvim_create_augroups({go = {{"FileType", "go", "setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=8"}}})

-- YAML -----------------------------------------
nvim_create_augroups(
    {
        yaml = {
            {"BufRead,BufNewFile", "*.yml,*.yaml", "set filetype=yaml"},
            {"FileType", "yaml", "setl tabstop=2 expandtab shiftwidth=2 softtabstop=2"}
        }
    }
)

-- MARKDOWN / RST -------------------------------
nvim_create_augroups(
    {
        pencil = {
            {"BufRead,BufNewFile", "*.markdown,*.md", "set filetype=markdown"},
            {"FileType", "markdown,mkd,rst", "call pencil#init()"},
            {"FileType", "markdown,mkd,rst", "setl tabstop=4 expandtab shiftwidth=4 softtabstop=4"},
            {"FileType", "markdown,mkd,rst", "setl syntax=off"}
        }
    }
)

-- VIMWIKI --------------------------------------
g["vimwiki_list"] = {{path = "~/permanent/vimwiki/", syntax = "markdown", ext = ".md", index = "Home"}}
g["vimwiki_global_ext"] = 0

nvim_create_augroups(
    {
        wiki = {
            {"FileType", "vimwiki", "call pencil#init()"},
            {"FileType", "vimwiki", "setl tabstop=4 expandtab shiftwidth=4 softtabstop=4"}
        }
    }
)

-- LATEX ----------------------------------------
nvim_create_augroups(
    {
        tex = {
            {"FileType", "tex", "call pencil#init()"},
            {"FileType", "tex", "setl tabstop=4 expandtab shiftwidth=4 softtabstop=4"}
        }
    }
)

-- JSON -----------------------------------------
nvim_create_augroups({json = {{"FileType", "json", "setl tabstop=2 expandtab shiftwidth=2 softtabstop=2"}}})

-- LEKTOR ---------------------------------------
nvim_create_augroups({lektor = {{"BufRead,BufNewFile", "*.lr", "set filetype=markdown"}}})

-- GOPASS ---------------------------------------
nvim_create_augroups(
    {gopass = {{"BufNewFile,BufRead", "/dev/shm/gopass.*", "setlocal noswapfile nobackup noundofile"}}}
)

-- LINT -----------------------------------------
nvim_create_augroups({lint = {{"BufWritePost", "*", "lua require('lint').try_lint()"}}})

local lint = require "lint"
lint.linters.golangcilint.args = {
    "run",
    "--enable-all",
    "--disable",
    "godox,tagliatelle,exhaustivestruct,varnamelen",
    "--out-format",
    "json"
}
lint.linters_by_ft = {
    go = {"golangcilint"},
    sh = {"shellcheck"},
    ansible = {"ansible_lint"}
}

-- FORMAT ---------------------------------------
nvim_create_augroups({format = {{"BufWritePost", "*", "FormatWrite"}}})

require("format").setup {
    go = {
        {
            cmd = {"goimports -w", "gofumpt -w"},
            tempfile_postfix = ".tmp"
        }
    },
    markdown = {
        {cmd = {"prettier -w"}}
    },
    yaml = {
        {cmd = {"prettier -w"}}
    },
    json = {
        {cmd = {"prettier -w"}}
    },
    vim = {
        {
            cmd = {"npx lua-fmt -w replace"},
            start_pattern = "^lua << EOF$",
            end_pattern = "^EOF$"
        }
    },
    lua = {
        {cmd = {"npx lua-fmt -w replace"}}
    },
    sh = {
        {cmd = {"shfmt -w"}}
    }
}

-- LUALINE --------------------------------------
require("lualine").setup {
    options = {
        theme = "dracula-nvim"
    }
}

-- LSP ------------------------------------------
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(
    function(server)
        local opts = {}
        if server.name == "gopls" then
            opts.init_options = {buildFlags = {"-tags=integration,tools"}}
        end
        server:setup(opts)
    end
)

-- COMPLETIONS ----------------------------------
local cmp = require "cmp"
cmp.setup(
    {
        mapping = {
            ["<CR>"] = cmp.mapping.confirm({select = true})
        },
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"},
                {name = "emoji"}
            },
            {
                {name = "buffer"}
            }
        )
    }
)
-- Use buffer source for `/` (if you enabled `native_menu`, this wont work anymore).
cmp.setup.cmdline(
    "/",
    {
        sources = {
            {name = "buffer"}
        }
    }
)
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this wont work anymore).
cmp.setup.cmdline(
    ":",
    {
        sources = cmp.config.sources(
            {
                {name = "path"}
            },
            {
                {name = "cmdline"}
            }
        )
    }
)

-- lspconfig
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- ZENMODE --------------------------------------
require("zen-mode").setup {
    plugins = {
        twilight = {enabled = true}
    }
}

-- GIST -----------------------------------------
g["gist_post_private"] = 1

-- PENCIL ---------------------------------------
g["pencil#wrapModeDefault"] = "soft"

-- IDENT_BLANKLINE -----------------------------
require("indent_blankline").setup {
    show_end_of_file = true
}

-- GITSIGNS -------------------------------------
require("gitsigns").setup()

-- TOPBAR ---------------------------------------
g.bufferline = {
    clickable = false,
    closable = false,
    tabpages = false
}

-- TROUBLE --------------------------------------
require("trouble").setup {
    auto_open = true,
    auto_close = true
}

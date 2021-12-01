-- HELPERS --------------------------------------
local cmd = vim.cmd -- to execute vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local b = vim.b
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
cmd "set clipboard+=unnamedplus" -- needed for neovim copy paste
opt.completeopt = "menu,menuone,noselect" -- needed for completion
opt.hidden = true

-- PLUGINS --------------------------------------
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap =
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

cmd [[packadd packer.nvim]]
require("packer").startup(
    {
        function(use)
            use {"wbthomason/packer.nvim"}

            use "savq/paq-nvim"
            use "Mofiqul/dracula.nvim"
            use "ConradIrwin/vim-bracketed-paste"
            use "chrisbra/Colorizer" -- color hex codes and color names
            use "cohama/lexima.vim" -- auto close parentheses

            use {
                "nvim-lualine/lualine.nvim",
                config = function()
                    require("lualine").setup {
                        options = {
                            theme = "dracula-nvim"
                        }
                    }
                end
            }

            use "mattn/gist-vim"
            use "ntpeters/vim-better-whitespace"
            use "reedes/vim-pencil"
            use "tpope/vim-surround"
            use "vimwiki/vimwiki"
            use "sheerun/vim-polyglot"
            use "chrisbra/unicode.vim"
            use "chrisbra/csv.vim"

            use {
                "lukas-reineke/indent-blankline.nvim",
                config = function()
                    require("indent_blankline").setup {
                        show_end_of_file = true,
                        space_char_blankline = " ",
                        show_current_context = true,
                        show_current_context_start = true
                    }
                end
            }

            use {
                "lewis6991/gitsigns.nvim",
                config = function()
                    require("gitsigns").setup()
                end,
                requires = {"nvim-lua/plenary.nvim"}
            }

            use "tpope/vim-commentary"
            use "chazy/dirsettings"
            use "mattn/webapi-vim" -- talk to apis
            use "dhruvasagar/vim-table-mode"

            use {
                "neovim/nvim-lspconfig",
                config = function()
                    vim.lsp.handlers["textDocument/hover"] =
                        vim.lsp.with(
                        vim.lsp.handlers.hover,
                        {
                            border = "single"
                        }
                    )

                    vim.lsp.handlers["textDocument/signatureHelp"] =
                        vim.lsp.with(
                        vim.lsp.handlers.signature_help,
                        {
                            border = "single"
                        }
                    )
                end
            }

            use {
                "williamboman/nvim-lsp-installer",
                config = function()
                    local lsp_installer = require("nvim-lsp-installer")

                    lsp_installer.on_server_ready(
                        function(server)
                            local opts = {}

                            if server.name == "gopls" then
                                opts.init_options = {buildFlags = {"-tags=integration,tools"}, gofumpt = true}
                            end

                            if server.name == "sumneko_lua" then
                                opts.settings = {
                                    Lua = {
                                        diagnostics = {
                                            globals = {"vim"}
                                        }
                                    }
                                }
                            end

                            server:setup(opts)
                        end
                    )
                end
            }

            use {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate",
                config = function()
                    require("nvim-treesitter.configs").setup {
                        ensure_installed = "maintained",
                        highlight = {enable = true}
                    }
                end
            }

            use {
                "romgrk/nvim-treesitter-context",
                config = function()
                    require("treesitter-context").setup()
                end
            }

            use {
                "hrsh7th/nvim-cmp",
                requires = {
                    {"neovim/nvim-lspconfig"},
                    {"hrsh7th/cmp-nvim-lsp"},
                    {"hrsh7th/cmp-buffer"},
                    {"hrsh7th/cmp-path"},
                    {"hrsh7th/cmp-cmdline"}
                },
                config = function()
                    local cmp = require "cmp"
                    cmp.setup(
                        {
                            mapping = {
                                ["<CR>"] = cmp.mapping.confirm({select = true})
                            },
                            sources = cmp.config.sources(
                                {
                                    {name = "nvim_lsp"},
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
                    require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
                end
            }

            use {"romgrk/barbar.nvim", requires = {"kyazdani42/nvim-web-devicons"}}

            use {
                "folke/zen-mode.nvim",
                requires = {"folke/twilight.nvim"},
                config = function()
                    require("zen-mode").setup {
                        plugins = {
                            twilight = {enabled = true}
                        }
                    }
                end
            }

            use {
                "mfussenegger/nvim-lint",
                config = function()
                    local lint = require "lint"
                    lint.linters.golangcilint.args = {
                        "run",
                        "--enable-all",
                        "--disable=godox,tagliatelle,exhaustivestruct,varnamelen",
                        "--build-tags=integration",
                        "--out-format",
                        "json"
                    }
                    lint.linters_by_ft = {
                        go = {"golangcilint"},
                        sh = {"shellcheck"},
                        ansible = {"ansible_lint"}
                    }
                end
            }

            use {
                "lukas-reineke/format.nvim",
                config = function()
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
                end
            }

            use {
                "folke/trouble.nvim",
                requires = {"kyazdani42/nvim-web-devicons"},
                config = function()
                    require("trouble").setup {
                        auto_open = true,
                        auto_close = true
                    }
                end
            }

            use "Xuyuanp/scrollbar.nvim"
            use "f-person/git-blame.nvim"

            use {
                "iamcco/markdown-preview.nvim",
                run = function()
                    fn["mkdp#util#install"](0)
                end
            }

            -- all the fzf things
            use {
                "junegunn/fzf",
                run = ":call fzf#install()"
            }

            use {
                "ibhagwan/fzf-lua",
                requires = {
                    "vijaymarupudi/nvim-fzf",
                    "kyazdani42/nvim-web-devicons"
                }
            }

            use {
                "gfanto/fzf-lsp.nvim",
                config = function()
                    require("fzf_lsp").setup()
                end
            }

            if Packer_bootstrap then
                require("packer").sync()
            end
        end
    }
)

-- UI -------------------------------------------
opt.number = true -- numbers on the side
opt.relativenumber = true -- ralative line numbers
opt.backspace = "2"
opt.laststatus = 2
opt.synmaxcol = 120
opt.cursorline = true

-- marks for file characters in the document
opt.listchars:append({eol = "↴"})
opt.listchars:append({trail = "-"})
opt.listchars:append({nbsp = "+"})
opt.listchars:append({extends = ">"})
opt.listchars:append({precedes = "<"})
opt.listchars:append({space = "⋅"})

opt.background = "dark"
opt.list = true -- show some hidden characters
opt.termguicolors = true -- true color support
opt.foldenable = false -- disable initional folding
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
map("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<Leader>fr", "<cmd>lua require('fzf-lua').lsp_references()<CR>")

-- fzf
map("n", ";", "<cmd>lua require('fzf-lua').buffers()<CR>")
map("n", "<Leader>ff", "<cmd>lua require('fzf-lua').files()<CR>")
map("n", "<Leader>rg", "<cmd>lua require('fzf-lua').grep_project()<CR>")
map("n", "<Leader>ll", "<cmd>lua require('fzf-lua').grep_curbuf()<CR>")
map("n", "<Leader>cm", "<cmd>lua require('fzf-lua').git_commits()<CR>")
map("n", "<Leader>cf", "<cmd>lua require('fzf-lua').git_bcommits()<CR>")

-- barbar
map("n", "<A-,>", ":BufferPrevious<CR>")
map("n", "<A-.>", ":BufferNext<CR>")

-- terminal mode
map("t", "<Leader><Esc>", "<C-\\><C-n>")

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

-- FORMAT ---------------------------------------
nvim_create_augroups({format = {{"BufWritePost", "*", "FormatWrite"}}})

-- GIST -----------------------------------------
g["gist_post_private"] = 1

-- PENCIL ---------------------------------------
g["pencil#wrapModeDefault"] = "soft"

-- TOPBAR ---------------------------------------
g.bufferline = {
    clickable = false,
    closable = false,
    tabpages = false
}

-- SCROLLBAR ------------------------------------
nvim_create_augroups(
    {
        scrollbar = {
            {"CursorMoved,VimResized,QuitPre", "*", "silent! lua require('scrollbar').show()"},
            {"WinEnter,FocusGained", "*", "silent! lua require('scrollbar').show()"},
            {"WinLeave,BufLeave,BufWinLeave,FocusLost", "*", "silent! lua require('scrollbar').clear()"}
        }
    }
)

g.scrollbar_shape = {
    head = "│",
    body = "│",
    tail = "│"
}

-- GITBLAME -------------------------------------
g.gitblame_enabled = 0

-- CSV ------------------------------------------
b.csv_arrange_use_all_rows = 1

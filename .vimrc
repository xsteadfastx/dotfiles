" ---------------------------------------
" GENERAL
" ---------------------------------------
set shell=/bin/sh
set nocompatible
filetype off
set enc=utf-8
set fenc=utf-8
set fileencoding=utf-8
filetype plugin indent on


" ---------------------------------------
" PLUGINS
" ---------------------------------------
if has('nvim')

	call plug#begin('~/.vim/plugged')

	Plug 'Mofiqul/dracula.nvim'

	Plug 'ConradIrwin/vim-bracketed-paste'

	Plug 'mhinz/vim-signify'

	" color hex codes and color names
	Plug 'chrisbra/Colorizer'

	" auto close parentheses
	Plug 'cohama/lexima.vim'

	Plug 'nvim-lualine/lualine.nvim'

	" nerd font in vim
	Plug 'ryanoasis/vim-devicons'

	Plug 'lepture/vim-jinja'

	Plug 'mattn/gist-vim'
		let g:gist_post_private = 1

	Plug 'ntpeters/vim-better-whitespace'

	Plug 'reedes/vim-pencil'
		let g:pencil#wrapModeDefault = 'soft'

	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
		map <C-n> :NERDTreeToggle<CR> " open nerdtree

	Plug 'tpope/vim-repeat'
		silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

	Plug 'tpope/vim-surround'

	Plug 'vimwiki/vimwiki'
		let g:vimwiki_list = [{'path': '~/permanent/vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'index': 'Home'}, {'path': '~/permanent/vimwiki-vwit/', 'syntax': 'markdown', 'ext': '.md', 'index': 'Home'}]
		let g:vimwiki_global_ext = 0

	" easy alignment
	Plug 'junegunn/vim-easy-align'
		xmap ga <Plug>(EasyAlign)
		nmap ga <Plug>(EasyAlign)

	" a collection of language packs
	Plug 'sheerun/vim-polyglot'

	" unicode handling
	Plug 'chrisbra/unicode.vim'

	" CSV
	Plug 'chrisbra/csv.vim'

	" visual ident levels
	Plug 'Yggdroot/indentLine'
		let g:indentLine_char = '┆'

	" git
	Plug 'tpope/vim-fugitive'

	" comments
	Plug 'tpope/vim-commentary'

	" dir settings
	Plug 'chazy/dirsettings'

	" talk to apis
	Plug 'mattn/webapi-vim'

	" ansible
	Plug 'pearofducks/ansible-vim'

	" ascii tables
	Plug 'dhruvasagar/vim-table-mode'

	" gemini
	Plug 'https://git.sr.ht/~torresjrjr/gemini.vim'

	" LSP
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'

	" telescope
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

	" treesitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	" completions
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/cmp-emoji'
	Plug 'hrsh7th/nvim-cmp'

	" top bar
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'romgrk/barbar.nvim'
		let bufferline = get(g:, 'bufferline', {})
		let bufferline.clickable = v:false
		let bufferline.closable = v:false
		let bufferline.tabpages = v:false

	" scrolling
	Plug 'karb94/neoscroll.nvim'

	" distraction free writing
	Plug 'folke/zen-mode.nvim'
	Plug 'folke/twilight.nvim'

	" linting
	Plug 'mfussenegger/nvim-lint'

	" format
	Plug 'lukas-reineke/format.nvim'

	call plug#end()

endif

" ---------------------------------------
" UI
" ---------------------------------------
set number
set relativenumber
set backspace=2
set laststatus=2
set synmaxcol=120
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
set background=dark
set t_Co=256
"hi Normal ctermbg=none " transparent background
let python_highlight_all=1
set listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+
set list
set cursorline
set termguicolors
set nofoldenable
set foldmethod=syntax

if has('nvim')
        if !empty(glob('~/.vim/plugged/dracula.nvim/colors/dracula.lua'))
                colors dracula
                syntax on
                highlight Comment cterm=italic gui=italic
        endif
endif

" ---------------------------------------
" TEXT FORMAT
" ---------------------------------------
set autoindent
set smartindent
set nowrap

" ---------------------------------------
" KEYMAPS
" ---------------------------------------
let mapleader = ","
let maplocalleader = "\\"

" hard mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" center line
nnoremap j jzz
nnoremap k kzz

" fixes some strange arrow errors in insert mode
imap ^[OA <ESC>kli
imap ^[OB <ESC>jli
imap ^[OC <ESC>lli
imap ^[OD <ESC>hli

vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" force tab
inoremap <S-Tab> <C-V><Tab>

" date shortcut
nnoremap <F5> "=strftime("%Y-%m-%d")<CR>P
inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>

if has('nvim')
    " circle through buffers
    nnoremap <F6> :Buffer<CR>

    " telescope
    nnoremap ; <cmd>Telescope buffers<CR>
    nnoremap <Leader>ff <cmd>Telescope find_files<CR>
    nnoremap <Leader>bb <cmd>Telescope buffers<CR>
    nnoremap <Leader>rg <cmd>Telescope live_grep<CR>
    nnoremap <Leader>ll <cmd>Telescope current_buffer_fuzzy_find<CR>
    nnoremap <Leader>le <cmd>Telescope lsp_workspace_diagnostics<CR>

    " LSP
    nnoremap <Leader>ho <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <Leader>gd <cmd>Telescope lsp_definitions<CR>
    nnoremap <Leader>fr <cmd>Telescope lsp_references<CR>
endif


" ---------------------------------------
" PYTHON
" ---------------------------------------
augroup python
    autocmd!
    au BufRead,BufNewFile *.xsh set filetype=python
    au FileType python set colorcolumn=88
augroup end

" ---------------------------------------
" HTML
" ---------------------------------------
augroup html
    autocmd!
    au FileType html setl sw=2 ts=2 sts=2
    au FileType htmldjango setl sw=2 ts=2 sts=2
augroup end

" ---------------------------------------
" CSS
" ---------------------------------------
augroup css
    autocmd!
    au BufRead,BufNewFile *scss set filetype=css
    au FileType css setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
                \ | ColorHighlight
augroup end

" ---------------------------------------
" JAVASCRIPT
" ---------------------------------------
augroup javascript
    autocmd!
    au FileType javascript setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
augroup end

" ---------------------------------------
" GOLANG
" ---------------------------------------
augroup go
    autocmd!
    au FileType go setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=8
augroup end


" ---------------------------------------
" NEOVIM
" ---------------------------------------
if has('nvim')
    " needed for copy paste in neovim
    set clipboard+=unnamedplus

    " using venvs for python support in neovim
    let g:python_host_prog = '/opt/neovim2/bin/python'
    let g:python3_host_prog = '/opt/neovim3/bin/python'

    " somehow this is needed
    "unlet g:loaded_python3_provider
endif

" ---------------------------------------
" YAML
" ---------------------------------------
augroup yaml
    autocmd!
    au BufRead,BufNewFile *yml,*yaml set filetype=yaml
    au FileType yaml setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
augroup end

" ---------------------------------------
" MARKDOWN / RST
" ---------------------------------------
augroup pencil
    autocmd!
    au BufRead,BufNewFile *.markdown,*.md set filetype=markdown
    au FileType markdown,mkd,rst call pencil#init()
                             " \ | setl spell spelllang=de
                             " \ | setl thesaurus+=~/.vim/thesaurus/openthesaurus.txt
                             \ | setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
                             \ | setl syntax=off
augroup end

" ---------------------------------------
" VIMWIKI
" ---------------------------------------
augroup wiki
    autocmd!
    au FileType vimwiki call pencil#init()
                             \ | setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
                             \ | let g:ale_open_list=0
augroup end

" ---------------------------------------
" LaTeX
" ---------------------------------------
augroup tex
    autocmd!
    au FileType tex call pencil#init()
                             \ | setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
augroup end

" ---------------------------------------
" JSON
" ---------------------------------------
"
augroup json
    autocmd!
    au FileType json setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
augroup end

" ---------------------------------------
" LEKTOR
" ---------------------------------------
augroup lektor
    autocmd!
    au BufRead,BufNewFile *.lr set filetype=markdown
augroup end

" ---------------------------------------
" JINJA.HTML
" ---------------------------------------
"
augroup jinja2
    autocmd!
    au FileType jinja2 setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
    au FileType jinja2 let g:ale_fix_on_save=0
augroup end

augroup jinjahtml
    autocmd!
    au FileType jinja.html let g:ale_fix_on_save=0
augroup end

" ---------------------------------------
" GOPASS
" ---------------------------------------
"
augroup gopass
    autocmd!
    au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile
augroup end

" ---------------------------------------
" LINT
" ---------------------------------------
"
augroup lint
    autocmd!
		au BufWritePost * lua require('lint').try_lint()
augroup end

" ---------------------------------------
" FORMAT
" ---------------------------------------
"
augroup format
    autocmd!
    au BufWritePost * FormatWrite
	augroup end

" ---------------------------------------
" LUA NEOVIM
" ---------------------------------------
if has('nvim')

set completeopt=menu,menuone,noselect

lua << EOF
-- Setup lualine.
require "lualine".setup()

-- Setup LSP.
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(
    function(server)
        local opts = {}
        server:setup(opts)
    end
)

-- Setup nvim-cmp.
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

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup Neoscroll.
require("neoscroll").setup()

-- Setup zen-mode
require("zen-mode").setup {
    plugins = {
        twilight = {enabled = true}
    }
}

-- Setup nvim-lint
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

-- Setup format.nvim
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
    sh = {
        {cmd = {"shfmt -w"}}
    }
}
EOF

endif

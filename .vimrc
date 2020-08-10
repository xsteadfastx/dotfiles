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

        Plug 'dracula/vim', { 'as': 'dracula' }

        Plug 'ConradIrwin/vim-bracketed-paste'

        Plug 'Konfekt/FastFold'

        Plug 'mhinz/vim-signify'

        " color hex codes and color names
        Plug 'chrisbra/Colorizer'

        " auto close parentheses
        Plug 'cohama/lexima.vim'

        Plug 'ervandew/supertab'

        " powerline
        Plug 'vim-airline/vim-airline'
            let g:airline_powerline_fonts = 1
            let g:airline#extensions#tabline#enabled = 1

        " nerd font in vim
        Plug 'ryanoasis/vim-devicons'

        Plug 'junegunn/goyo.vim'

        Plug 'junegunn/limelight.vim'
            let g:limelight_conceal_ctermfg = 'gray'
            let g:limelight_conceal_ctermfg = 240
            let g:limelight_default_coefficient = 0.7

        Plug 'lepture/vim-jinja'

        Plug 'mattn/gist-vim'
            let g:gist_post_private = 1

        Plug 'ntpeters/vim-better-whitespace'

        Plug 'reedes/vim-pencil'
            let g:pencil#wrapModeDefault = 'soft'

        Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
            map <C-n> :NERDTreeToggle<CR> " open nerdtree

        Plug 'tmhedberg/SimpylFold'
            let g:SimpylFold_docstring_preview=1

        Plug 'tpope/vim-repeat'
            silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

        Plug 'tpope/vim-surround'

        Plug 'vimwiki/vimwiki'
            let g:vimwiki_list = [{'path': '~/permanent/vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'index': 'Home'}, {'path': '~/permanent/vimwiki-vwit/', 'syntax': 'markdown', 'ext': '.md', 'index': 'Home'}]
            let g:vimwiki_global_ext = 0

        let g:ale_completion_enabled = 1
        let g:ale_set_balloons = 1
        Plug 'dense-analysis/ale'
            let g:ale_open_list = 'on_save'
            let g:ale_fix_on_save = 1
            let g:ale_fixers = {
                \ 'python': ['isort', 'black'],
                \ 'go': ['gofmt', 'goimports'],
                \ 'javascript': ['eslint'],
                \ 'css': ['prettier'],
                \ 'less': ['prettier'],
                \ 'scss': ['prettier'],
                \ 'html': ['prettier'],
                \ 'json': ['prettier'],
                \ 'yaml': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
                \ 'markdown': ['prettier'],
                \ 'sh': ['shfmt']
                \ }
            let g:ale_languagetool_executable= 'languagetool-commandline'
            let g:ale_languagetool_options = '-l de-DE'
            let g:ale_linters= {
                \ 'python': ['bandit', 'mypy', 'prospector', 'pydocstyle', 'pyls'],
                \ 'markdown': ['languagetool'],
                \ 'go': ['gofmt', 'golangci-lint', 'gopls'],
                \ 'javascript': ['eslint']
                \ }
            let g:ale_python_mypy_options = '--ignore-missing-imports --follow-imports=skip --strict-optional'
            let g:ale_python_pylint_executable = 'python -m pylint'
            let g:ale_go_gopls_executable = expand($HOME).'/.local/share/go/bin/gopls'
            let g:ale_go_langserver_executable = expand($HOME).'/.local/share/go/bin/gopls'
            let g:ale_go_golangci_lint_executable = expand($HOME).'/.local/share/go/bin/golangci-lint'
            let g:ale_javascript_prettier_executable = expand($HOME).'/node_modules/.bin/prettier'
            let g:ale_javascript_eslint_executable = expand($HOME).'/node_modules/.bin/eslint'
            let g:ale_sh_shfmt_executable = expand($HOME).'/.local/share/go/bin/shfmt'

        " easy alignment
        Plug 'junegunn/vim-easy-align'
            xmap ga <Plug>(EasyAlign)
            nmap ga <Plug>(EasyAlign)

        " a collection of language packs
        Plug 'sheerun/vim-polyglot', { 'tag': 'v4.1.2' }

        " unicode handling
        Plug 'chrisbra/unicode.vim'

        " CSV
        Plug 'chrisbra/csv.vim'

        " LaTeX
        "Plug 'lervag/vimtex'

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

        " fzf
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
            let g:fzf_preview_window = ''

        " ansible
        Plug 'pearofducks/ansible-vim'

        " ascii tables
        Plug 'dhruvasagar/vim-table-mode'

        call plug#end()

endif

" ---------------------------------------
" UI
" ---------------------------------------
set number
set relativenumber
set backspace=2
set laststatus=2
set foldenable
set synmaxcol=120
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
set background=dark
set t_Co=256
"hi Normal ctermbg=none " transparent background
let python_highlight_all=1
set listchars=trail:·,precedes:«,extends:»,nbsp:~,tab:▸\ 
set list
set cursorline
set termguicolors

if has('nvim')
        if !empty(glob('~/.vim/plugged/dracula/colors/dracula.vim'))
                colors dracula
                syntax on
        endif
endif

" ---------------------------------------
" TEXT FORMAT
" ---------------------------------------
set autoindent
set smartindent
set nowrap
set expandtab
set nosmarttab

" automatically remove trail. whitespace at write
"au BufWritePre <buffer> StripWhitespace

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

    " fzf
    nnoremap ; :Buffers<CR>
    nnoremap <Leader>ff :FZF<CR>
    nnoremap <Leader>bb :Buffers<CR>
    nnoremap <Leader>ll :Lines<CR>
    nnoremap <Leader>rg :Rg<CR>

    " ALE
    nnoremap <Leader>ho :ALEHover<CR>
    nnoremap <Leader>gd :ALEGoToDefinition<CR>
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
    au FileType go setl tabstop=4 shiftwidth=4
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
    " au BufRead,BufNewFile *yml,*yaml set filetype=yaml
    " au FileType yaml setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
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
    au User GoyoEnter Limelight
    au User GoyoLeave Limelight!
    au User GoyoLeave nested set background=dark
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

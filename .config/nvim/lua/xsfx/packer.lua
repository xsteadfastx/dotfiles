local fn = vim.fn -- to call vim functions e.g. fn.bufnr()
local cmd = vim.cmd -- to execute vim commands e.g. cmd('pwd')

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

cmd([[packadd packer.nvim]])
require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("Mofiqul/dracula.nvim")
    use("ConradIrwin/vim-bracketed-paste")
    use("chrisbra/Colorizer") -- color hex codes and color names
    use("cohama/lexima.vim") -- auto close parentheses
    use("nvim-lualine/lualine.nvim")
    use("mattn/gist-vim")
    use("ntpeters/vim-better-whitespace")
    use("reedes/vim-pencil")
    use("tpope/vim-surround")
    use("vimwiki/vimwiki")
    use("sheerun/vim-polyglot")
    use("chrisbra/unicode.vim")
    use("chrisbra/csv.vim")
    use("lukas-reineke/indent-blankline.nvim")
    use({
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })
    use("numToStr/Comment.nvim")
    use("chazy/dirsettings")
    use("mattn/webapi-vim")
    use("dhruvasagar/vim-table-mode")
    use({
      "williamboman/mason.nvim",
      requires = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/nvim-cmp",
        "neovim/nvim-lspconfig",
      },
    })
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })
    use("romgrk/nvim-treesitter-context")
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "andersevenrud/cmp-tmux" },
        { "hrsh7th/cmp-vsnip" },
        { "hrsh7th/vim-vsnip" },
        { "rafamadriz/friendly-snippets" },
        { "golang/vscode-go" },
      },
    })
    use({
      "romgrk/barbar.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
    })
    use({
      "folke/zen-mode.nvim",
      requires = { "folke/twilight.nvim" },
    })
    use("mfussenegger/nvim-lint")
    use("mhartington/formatter.nvim")
    use({
      "folke/trouble.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
    })
    use("APZelos/blamer.nvim")
    use("iamcco/markdown-preview.nvim")
    use({
      "junegunn/fzf",
      run = "./install --bin",
    })
    use({
      "ibhagwan/fzf-lua",
      requires = {
        "kyazdani42/nvim-web-devicons",
      },
      after = "nvim-dap-go",
    })
    use("karb94/neoscroll.nvim")
    use({
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
    })
    -- use("yamatsum/nvim-cursorline")
    use("buoto/gotests-vim")
    use("vim-test/vim-test")
    use("preservim/vimux")
    use({
      "leoluz/nvim-dap-go",
      requires = "mfussenegger/nvim-dap",
    })
    use("folke/which-key.nvim")
    use("j-hui/fidget.nvim")
    use("fatih/vim-go")
    use({
      "rcarriga/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "akinsho/neotest-go",
      },
    })
    use("b0o/SchemaStore.nvim")
    use("stevearc/dressing.nvim")
    if Packer_bootstrap then
      require("packer").sync()
    end
  end,
})

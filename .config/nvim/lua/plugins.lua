local fn = vim.fn -- to call vim functions e.g. fn.bufnr()
local cmd = vim.cmd -- to execute vim commands e.g. cmd('pwd')

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

local function get_config(name)
  return string.format('require("config/%s")', name)
end

cmd [[packadd packer.nvim]]
require("packer").startup(
  {
    function(use)
      use { "wbthomason/packer.nvim" }
      use "Mofiqul/dracula.nvim"
      use "ConradIrwin/vim-bracketed-paste"
      use "chrisbra/Colorizer" -- color hex codes and color names
      use "cohama/lexima.vim" -- auto close parentheses
      use {
        "nvim-lualine/lualine.nvim",
        config = get_config("lualine")
      }
      use { "mattn/gist-vim", config = get_config("gist") }
      use "ntpeters/vim-better-whitespace"
      use { "reedes/vim-pencil", config = get_config("pencil") }
      use "tpope/vim-surround"
      use { "vimwiki/vimwiki", config = get_config("vimwiki") }
      use "sheerun/vim-polyglot"
      use "chrisbra/unicode.vim"
      use { "chrisbra/csv.vim", config = get_config("csv") }
      use {
        "lukas-reineke/indent-blankline.nvim",
        config = get_config("indent-blankline")
      }
      use {
        "lewis6991/gitsigns.nvim",
        config = get_config("gitsigns"),
        requires = { "nvim-lua/plenary.nvim" }
      }
      use {
        "numToStr/Comment.nvim",
        config = get_config("comment")
      }
      use "chazy/dirsettings"
      use "mattn/webapi-vim" -- talk to apis
      use "dhruvasagar/vim-table-mode"
      use {
        "williamboman/nvim-lsp-installer",
        requires = {
          "hrsh7th/nvim-cmp"
        },
        {
          "neovim/nvim-lspconfig",
          config = get_config("nvim-lspconfig")
        }
      }
      use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = get_config("nvim-treesitter")
      }
      use {
        "romgrk/nvim-treesitter-context",
        config = get_config("nvim-treesitter-context")
      }
      use {
        "hrsh7th/nvim-cmp",
        requires = {
          { "hrsh7th/cmp-nvim-lsp" },
          { "hrsh7th/cmp-buffer" },
          { "hrsh7th/cmp-path" },
          { "hrsh7th/cmp-cmdline" },
          { "andersevenrud/cmp-tmux" }
        },
        config = get_config("nvim-cmp")
      }
      use {
        "romgrk/barbar.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        setup = get_config("topbar")
      }
      use {
        "folke/zen-mode.nvim",
        requires = { "folke/twilight.nvim" },
        config = get_config("zen-mode")
      }
      use {
        "mfussenegger/nvim-lint",
        config = get_config("nvim-lint")
      }
      use {
        "mhartington/formatter.nvim",
        config = get_config("formatter")
      }
      use {
        "folke/trouble.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = get_config("trouble")
      }
      use { "Xuyuanp/scrollbar.nvim", setup = get_config("scrollbar") }
      use {
        "f-person/git-blame.nvim",
        config = get_config("git-blame")
      }
      use {
        "iamcco/markdown-preview.nvim",
        run = get_config("markdown-preview")
      }
      use {
        "junegunn/fzf",
        run = "./install --bin"
      }
      use {
        "ibhagwan/fzf-lua",
        requires = {
          "kyazdani42/nvim-web-devicons"
        },
        after = "nvim-dap-go",
        config = get_config("fzf-lua")
      }
      use {
        "karb94/neoscroll.nvim",
        config = get_config("neoscroll")
      }
      use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = get_config("todo-comments")
      }
      use {
        "yamatsum/nvim-cursorline",
        config = get_config("nvim-cursorline")
      }
      use "buoto/gotests-vim"
      use "vim-test/vim-test"
      use "preservim/vimux"
      use {
        "leoluz/nvim-dap-go",
        requires = "mfussenegger/nvim-dap",
        config = get_config("dap-go")
      }
      use {
        "folke/which-key.nvim",
        config = get_config("which-key")
      }
      use {
        "j-hui/fidget.nvim",
        config = get_config("fidget")
      }
      use {
        "fatih/vim-go",
        config = get_config("go-vim")
      }
      if Packer_bootstrap then
        require("packer").sync()
      end
    end
  }
)

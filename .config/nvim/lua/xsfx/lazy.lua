local fn = vim.fn   -- to call vim functions e.g. fn.bufnr()
local cmd = vim.cmd -- to execute vim commands e.g. cmd('pwd')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"Mofiqul/dracula.nvim",
		config = function()
			require("dracula").setup({
				italic_comment = true,
			})
			cmd([[colorscheme dracula]])
		end,
	},

	-- enables transparent pasting into vim. (i.e. no more :set paste!)
	"ConradIrwin/vim-bracketed-paste",

	-- a plugin to color colornames and codes
	"chrisbra/Colorizer",

	-- auto close parentheses
	"cohama/lexima.vim",

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "dracula-nvim",
				},
			})
		end,
	},

	-- a "buffer and tab" tabline for neovim
	{
		"kdheepak/tabline.nvim",
		config = function()
			require("tabline").setup({
				enable = true,
			})
		end,
	},

	--  creating gists
	{
		"mattn/gist-vim",
		dependencies = { "mattn/webapi-vim" },
		config = function()
			vim.g["gist_post_private"] = 1
		end,
	},

	-- causes all trailing whitespace characters to be highlighted.
	"ntpeters/vim-better-whitespace",

	-- make Vim as powerful a tool for writers as it is for coders by focusing narrowly on the handful of tweaks needed to smooth the path to writing prose
	{
		"reedes/vim-pencil",
		config = function()
			vim.g["pencil#wrapModeDefault"] = "soft"
		end,
	},

	-- the plugin provides mappings to easily delete, change and add such surroundings in pairs
	"tpope/vim-surround",

	-- personal wiki for vim
	{
		"vimwiki/vimwiki",
		config = function()
			require("xsfx.packer_configs.vimwiki")
		end,
	},

	-- a solid language pack for Vim
	{ "sheerun/vim-polyglot" },

	-- a Filetype plugin for csv files
	{
		"chrisbra/csv.vim",
		config = function()
			vim.b.csv_arrange_use_all_rows = 1
		end,
	},

	-- adds indentation guides to all lines (including empty lines)
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				show_end_of_file = true,
				space_char_blankline = " ",
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	},

	-- git decorations
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
	},

	-- commenting plugin
	{
		"numToStr/Comment.nvim",
		config = true,
	},

	-- dirsettings allow you to customize the behaviro of VIM in a single subtree by placing a .vimdir file in the root of that directory
	"chazy/dirsettings",

	-- automatic table creator & formatter
	"dhruvasagar/vim-table-mode",

	-- install and manage LSP servers, DAP servers, linters, and formatters
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"hrsh7th/nvim-cmp",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("xsfx.packer_configs.lspconfig")
		end,
	},

	-- provide a simple and easy way to use the interface for tree-sitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	--  show code context
	{
		"romgrk/nvim-treesitter-context",
		config = true,
	},

	-- completions
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "andersevenrud/cmp-tmux" },
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			require("xsfx.packer_configs.nvim-cmp")
			require("xsfx.packer_configs.luasnip-cfg")
		end,
	},

	-- an asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("xsfx.packer_configs.nvim-lint")
		end,
	},

	-- format runner
	{
		"mhartington/formatter.nvim",
		config = function()
			require("xsfx.packer_configs.formatter")
		end,
	},

	-- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
	{
		"folke/trouble.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("trouble").setup({
				auto_open = false,
				auto_close = true,
				use_lsp_diagnostic_signs = false,
			})
		end,
	},

	-- git blame plugin
	"APZelos/blamer.nvim",

	-- markdown preview plugin
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			fn["mkdp#util#install"](0)
		end,
	},

	-- all glory to fzf
	{
		"ibhagwan/fzf-lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			{
				"junegunn/fzf",
				build = "./install --bin",
			},
		},
		config = function()
			require("xsfx.packer_configs.fzf-lua")
		end,
	},

	-- smooth scrolling
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},

	-- highlight, list and search todo comments in your projects
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
	},

	-- easily interact with tmux from vim
	-- with plugin to run go tests in tmux
	{ "preservim/vimux",     dependencies = { "benmills/vimux-golang" } },

	-- debug Adapter Protocol client implementation
	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
		config = function()
			require("dap-go").setup()

			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()

			-- auto starting dapui
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	-- displays a popup with possible keybindings of the command you started typing
	{
		"folke/which-key.nvim",
		config = true,
	},

	-- standalone UI for nvim-lsp progress
	{
		"j-hui/fidget.nvim",
		config = true,
	},

	-- an extensible framework for interacting with tests within NeoVim
	{
		"rcarriga/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"akinsho/neotest-go",
		},
		config = function()
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
								diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)
			require("neotest").setup({
				adapters = {
					require("neotest-go"),
				},
			})
		end,
	},

	-- JSON schemas for Neovim
	"b0o/SchemaStore.nvim",

	-- improve the default vim.ui interfaces
	"stevearc/dressing.nvim",

	-- follow markdown links
	{ "jghauser/follow-md-links.nvim" },

	-- dev setup for init.lua and plugin development
	{ "folke/neodev.nvim" },

	-- plugin for neovim that highlights cursor words and lines
	{
		"yamatsum/nvim-cursorline",
		config = function()
			require("nvim-cursorline").setup({
				cursorline = { enable = true, timeout = 500 },
				cursorword = { enable = true, min_length = 3, hl = { underline = true } },
			})
		end,
	},

	-- Earthfile syntax highlighting for vim
	"earthly/earthly.vim",

	-- EditorConfig plugin for Neovim
	"gpanders/editorconfig.nvim",

	-- minimap plugin for neovim
	{
		"gorbit99/codewindow.nvim",
		config = function()
			local codewindow = require("codewindow")
			codewindow.setup({
				auto_enable = false,
			})
			codewindow.apply_default_keybinds()
		end,
	},

	-- Detect tabstop and shiftwidth automatically
	-- "tpope/vim-sleuth",

	"terrastruct/d2-vim",
})

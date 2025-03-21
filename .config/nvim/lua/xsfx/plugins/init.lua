local cmd = vim.cmd -- to execute vim commands e.g. cmd('pwd')

return {
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

			local api = vim.api
			local group = api.nvim_create_augroup("pencil", { clear = true })

			api.nvim_create_autocmd("Filetype", {
				pattern = "tex,markdown,mkd,vimwiki",
				callback = function()
					vim.cmd("call pencil#init()")
				end,
				group = group,
			})
		end,
	},

	-- the plugin provides mappings to easily delete, change and add such surroundings in pairs
	"tpope/vim-surround",

	-- a solid language pack for Vim
	-- { "sheerun/vim-polyglot" },

	-- a Filetype plugin for csv files
	{
		"chrisbra/csv.vim",
		config = function()
			vim.b.csv_arrange_use_all_rows = 1
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
	-- "chazy/dirsettings",

	-- automatic table creator & formatter
	"dhruvasagar/vim-table-mode",

	-- provide a simple and easy way to use the interface for tree-sitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				highlight = { enable = true },
				indent = { enable = true },
				markid = { enable = true },
			})
		end,
	},

	--  show code context
	{
		"romgrk/nvim-treesitter-context",
		config = true,
	},

	-- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
	{
		"folke/trouble.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		cmd = "Trouble",
		keys = {
			{ "<C-t>", "<cmd>Trouble diagnostics toggle<CR>" },
		},
		config = function()
			require("trouble").setup({
				auto_open = false,
				auto_close = true,
				use_lsp_diagnostic_signs = false,
			})
		end,
	},

	-- git blame plugin
	{
		"FabijanZulj/blame.nvim",
		setup = true,
		opts = {
			blame_options = { "-w" },
		},
	},

	-- smooth scrolling
	{
		"karb94/neoscroll.nvim",
		config = true,
	},

	-- highlight, list and search todo comments in your projects
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
	},

	-- displays a popup with possible keybindings of the command you started typing
	{
		"folke/which-key.nvim",
		config = true,
	},

	-- standalone UI for nvim-lsp progress
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = true,
	},

	-- JSON schemas for Neovim
	"b0o/SchemaStore.nvim",

	-- improve the default vim.ui interfaces
	"stevearc/dressing.nvim",

	-- follow markdown links
	{ "jghauser/follow-md-links.nvim" },

	-- dev setup for init.lua and plugin development
	{ "folke/lazydev.nvim" },

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
	{
		"earthly/earthly.vim",
		lazy = false,
	},

	-- Detect tabstop and shiftwidth automatically
	-- "tpope/vim-sleuth",

	{ "terrastruct/d2-vim", ft = { "d2" } },

	-- A Neovim extension to highlight same-name identifiers with the same color
	"David-Kunz/markid",

	-- Grafana Alloy support for Vim/Neovim
	"grafana/vim-alloy",

	-- Rainbow delimiters for Neovim with Tree-sitter
	"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
}

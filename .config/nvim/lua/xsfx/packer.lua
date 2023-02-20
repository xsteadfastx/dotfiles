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

		-- dracula theme
		use({
			"Mofiqul/dracula.nvim",
			config = function()
				require("dracula").setup({
					italic_comment = true,
				})
				vim.cmd([[colorscheme dracula]])
			end,
		})

		-- enables transparent pasting into vim. (i.e. no more :set paste!)
		use("ConradIrwin/vim-bracketed-paste")

		-- a plugin to color colornames and codes
		use("chrisbra/Colorizer")

		-- auto close parentheses
		use("cohama/lexima.vim")

		-- statusline
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("lualine").setup({
					options = {
						theme = "dracula-nvim",
					},
				})
			end,
		})

		-- a "buffer and tab" tabline for neovim
		use({
			"kdheepak/tabline.nvim",
			config = function()
				require("tabline").setup({
					enable = true,
				})
			end,
		})

		--  creating gists
		use({
			"mattn/gist-vim",
			requires = { "mattn/webapi-vim" },
			config = function()
				vim.g["gist_post_private"] = 1
			end,
		})

		-- causes all trailing whitespace characters to be highlighted.
		use("ntpeters/vim-better-whitespace")

		-- make Vim as powerful a tool for writers as it is for coders by focusing narrowly on the handful of tweaks needed to smooth the path to writing prose
		use({
			"reedes/vim-pencil",
			config = function()
				vim.g["pencil#wrapModeDefault"] = "soft"
			end,
		})

		-- the plugin provides mappings to easily delete, change and add such surroundings in pairs
		use("tpope/vim-surround")

		-- personal wiki for vim
		use({
			"vimwiki/vimwiki",
			config = function()
				require("xsfx.packer_configs.vimwiki")
			end,
		})

		-- a solid language pack for Vim
		use("sheerun/vim-polyglot")

		-- a Filetype plugin for csv files
		use({
			"chrisbra/csv.vim",
			config = function()
				vim.b.csv_arrange_use_all_rows = 1
			end,
		})

		-- adds indentation guides to all lines (including empty lines)
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("indent_blankline").setup({
					show_end_of_file = true,
					space_char_blankline = " ",
					show_current_context = true,
					show_current_context_start = true,
				})
			end,
		})

		-- git decorations
		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("gitsigns").setup()
			end,
		})

		-- commenting plugin
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})

		-- dirsettings allow you to customize the behaviro of VIM in a single subtree by placing a .vimdir file in the root of that directory
		use("chazy/dirsettings")

		-- automatic table creator & formatter
		use("dhruvasagar/vim-table-mode")

		-- install and manage LSP servers, DAP servers, linters, and formatters
		use({
			"williamboman/mason.nvim",
			requires = {
				"williamboman/mason-lspconfig.nvim",
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				"hrsh7th/nvim-cmp",
				"neovim/nvim-lspconfig",
			},
			config = function()
				require("xsfx.packer_configs.lspconfig")
			end,
		})

		-- provide a simple and easy way to use the interface for tree-sitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					ensure_installed = "all",
					highlight = { enable = true },
					indent = { enable = true },
				})
			end,
		})

		--  show code context
		use({
			"romgrk/nvim-treesitter-context",
			config = function()
				require("treesitter-context").setup()
			end,
		})

		-- completions
		use({
			"hrsh7th/nvim-cmp",
			requires = {
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
		})

		-- an asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support
		use({
			"mfussenegger/nvim-lint",
			config = function()
				require("xsfx.packer_configs.nvim-lint")
			end,
		})

		-- format runner
		use({
			"mhartington/formatter.nvim",
			config = function()
				require("xsfx.packer_configs.formatter")
			end,
		})

		-- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
		use({
			"folke/trouble.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("trouble").setup({
					auto_open = false,
					auto_close = true,
					use_lsp_diagnostic_signs = false,
				})
			end,
		})

		-- git blame plugin
		use("APZelos/blamer.nvim")

		-- markdown preview plugin
		use({
			"iamcco/markdown-preview.nvim",
			config = function()
				vim.fn["mkdp#util#install"](0)
			end,
		})

		-- all glory to fzf
		use({
			"ibhagwan/fzf-lua",
			requires = {
				"kyazdani42/nvim-web-devicons",
				{
					"junegunn/fzf",
					run = "./install --bin",
				},
			},
			after = "nvim-dap-go",
			config = function()
				require("xsfx.packer_configs.fzf-lua")
			end,
		})

		-- smooth scrolling
		use({
			"karb94/neoscroll.nvim",
			config = function()
				require("neoscroll").setup()
			end,
		})

		-- highlight, list and search todo comments in your projects
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup({})
			end,
		})

		-- easily interact with tmux from vim
		-- with plugin to run go tests in tmux
		use({ "preservim/vimux", requires = "benmills/vimux-golang" })

		-- debug Adapter Protocol client implementation
		use({
			"leoluz/nvim-dap-go",
			requires = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
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
		})

		-- displays a popup with possible keybindings of the command you started typing
		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup()
			end,
		})

		-- standalone UI for nvim-lsp progress
		use({
			"j-hui/fidget.nvim",
			config = function()
				require("fidget").setup()
			end,
		})

		--  go development plugin for vim
		-- use({
		-- 	"fatih/vim-go",
		-- 	config = function()
		-- 		vim.g.go_code_completion = 0
		-- 		vim.g.go_fmt_autosave = 0
		-- 		vim.g.go_def_mapping_enabled = 0
		-- 	end,
		-- })

		-- an extensible framework for interacting with tests within NeoVim
		use({
			"rcarriga/neotest",
			requires = {
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
		})

		-- JSON schemas for Neovim
		use("b0o/SchemaStore.nvim")

		-- improve the default vim.ui interfaces
		use("stevearc/dressing.nvim")

		-- follow markdown links
		use({ "jghauser/follow-md-links.nvim" })

		-- dev setup for init.lua and plugin development
		use({ "folke/neodev.nvim" })

		-- plugin for neovim that highlights cursor words and lines
		use({
			"yamatsum/nvim-cursorline",
			config = function()
				require("nvim-cursorline").setup({
					cursorline = { enable = true, timeout = 500 },
					cursorword = { enable = true, min_length = 3, hl = { underline = true } },
				})
			end,
		})

		-- Earthfile syntax highlighting for vim
		use("earthly/earthly.vim")

		-- EditorConfig plugin for Neovim
		use("gpanders/editorconfig.nvim")

		-- minimap plugin for neovim
		use({
			"gorbit99/codewindow.nvim",
			config = function()
				local codewindow = require("codewindow")
				codewindow.setup({
					auto_enable = false,
				})
				codewindow.apply_default_keybinds()
			end,
		})

		-- Detect tabstop and shiftwidth automatically
		use("tpope/vim-sleuth")

		use("terrastruct/d2-vim")

		if Packer_bootstrap then
			require("packer").sync()
		end
	end,
})

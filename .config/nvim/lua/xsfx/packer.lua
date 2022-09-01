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
		use({
			"Mofiqul/dracula.nvim",
			config = function()
				require("dracula").setup({
					italic_comment = true,
				})
				vim.cmd([[colorscheme dracula]])
			end,
		})
		use("ConradIrwin/vim-bracketed-paste")
		use("chrisbra/Colorizer") -- color hex codes and color names
		use("cohama/lexima.vim") -- auto close parentheses
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
		use({ -- A "buffer and tab" tabline for neovim
			"kdheepak/tabline.nvim",
			config = function()
				require("tabline").setup({
					enable = true,
				})
			end,
		})
		use({
			"mattn/gist-vim",
			config = function()
				vim.g["gist_post_private"] = 1
			end,
		})
		use("ntpeters/vim-better-whitespace")
		use({
			"reedes/vim-pencil",
			config = function()
				vim.g["pencil#wrapModeDefault"] = "soft"
			end,
		})
		use("tpope/vim-surround")
		use({
			"vimwiki/vimwiki",
			config = function()
				require("xsfx.packer_configs.vimwiki")
			end,
		})
		use("sheerun/vim-polyglot")
		use("chrisbra/unicode.vim")
		use({
			"chrisbra/csv.vim",
			config = function()
				vim.b.csv_arrange_use_all_rows = 1
			end,
		})
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
		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("gitsigns").setup()
			end,
		})
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})
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
			config = function()
				require("xsfx.packer_configs.lspconfig")
			end,
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					ensure_installed = "all",
					highlight = { enable = true },
				})
			end,
		})
		use({
			"romgrk/nvim-treesitter-context",
			config = function()
				require("treesitter-context").setup()
			end,
		})
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
			config = function()
				require("xsfx.packer_configs.nvim-cmp")
			end,
		})
		use({
			"folke/zen-mode.nvim",
			requires = { "folke/twilight.nvim" },
			config = function()
				require("zen-mode").setup({
					plugins = {
						twilight = { enabled = true },
					},
				})
			end,
		})
		use({
			"mfussenegger/nvim-lint",
			config = function()
				require("xsfx.packer_configs.nvim-lint")
			end,
		})
		use({
			"mhartington/formatter.nvim",
			config = function()
				require("xsfx.packer_configs.formatter")
			end,
		})
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
		use("APZelos/blamer.nvim")
		use({
			"iamcco/markdown-preview.nvim",
			config = function()
				vim.fn["mkdp#util#install"](0)
			end,
		})
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
			config = function()
				require("xsfx.packer_configs.fzf-lua")
			end,
		})
		use({
			"karb94/neoscroll.nvim",
			config = function()
				require("neoscroll").setup()
			end,
		})
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup({})
			end,
		})
		use("buoto/gotests-vim")
		use("vim-test/vim-test")
		use({ "preservim/vimux", requires = "benmills/vimux-golang" })
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
		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup()
			end,
		})
		use({
			"j-hui/fidget.nvim",
			config = function()
				require("fidget").setup()
			end,
		})
		use({
			"fatih/vim-go",
			config = function()
				vim.g.go_code_completion = 0
				vim.g.go_fmt_autosave = 0
				vim.g.go_def_mapping_enabled = 0
			end,
		})
		use({
			"rcarriga/neotest",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-treesitter/nvim-treesitter",
				"antoinemadec/FixCursorHold.nvim",
				"akinsho/neotest-go",
			},
			config = function()
				require("neotest").setup({
					adapters = {
						require("neotest-go"),
					},
				})
			end,
		})
		use("b0o/SchemaStore.nvim")
		use("stevearc/dressing.nvim")
		use({ "jghauser/follow-md-links.nvim" })
		use({ "folke/lua-dev.nvim" })
		if Packer_bootstrap then
			require("packer").sync()
		end
	end,
})

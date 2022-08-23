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
        vim.g["vimwiki_list"] =
        { { path = "~/permanent/vimwiki/", syntax = "markdown", ext = ".md", index = "Home" } }
        vim.g["vimwiki_global_ext"] = 0

        require("xsfx.helpers").create_augroups({
          wiki = {
            { "FileType", { pattern = "vimwiki", command = "call pencil#init()" } },
            {
              "FileType",
              { pattern = "vimwiki", command = "setl tabstop=4 expandtab shiftwidth=4 softtabstop=4" },
            },
          },
        })
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
        local mason = require("mason")
        mason.setup({})

        -- lsp configuration
        local msonlsp = require("mason-lspconfig")
        local lspconfig = require("lspconfig")

        msonlsp.setup({
          {
            ensure_installed = {
              "ansiblels",
              "cmake",
              "dockerls",
              "eslint",
              "flux_lsp",
              "golangci_lint_ls",
              "gopls",
              "html",
              "jsonls",
              "marksman",
              "sqlls",
              "sqls",
              "sumneko_lua",
              "taplo",
              "tflint",
              "tsserver",
              "vimls",
              "yamlls",
            },
          },
        })

        local capabilities =
        require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

        msonlsp.setup_handlers({
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,
          ["gopls"] = function()
            lspconfig.gopls.setup({
              capabilities = capabilities,
              init_options = {
                buildFlags = { "-tags=integration,tools" },
                gofumpt = true,
              },
            })
          end,
          ["sumneko_lua"] = function()
            lspconfig.sumneko_lua.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                  workspace = {
                    library = {
                      [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                      [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    },
                  },
                },
              },
            })
          end,
          ["jsonls"] = function()
            lspconfig.jsonls.setup({
              capabilities = capabilities,
              settings = {
                json = {
                  schemas = require("schemastore").json.schemas(),
                  validate = { enable = true },
                },
              },
            })
          end,
        })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
          border = "single",
        })

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
          border = "single",
        })

        -- install the other mason
        require("mason-tool-installer").setup({
          run_on_start = true,
          start_delay = 3000,
          ensure_installed = {
            "buf",
            "clang-format",
            "go-debug-adapter",
            "gofumpt",
            "goimports",
            "golines",
            "gopls",
            "hadolint",
            "markdownlint",
            "prettier",
            "shfmt",
            "sql-formatter",
            "stylua",
            "tflint",
          },
        })
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
        vim.opt.completeopt = "menu,menuone,noselect"

        local cmp = require("cmp")

        cmp.setup({
          snippet = {
            expand = function(args)
              vim.fn["vsnip#anonymous"](args.body)
            end,
          },
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "vsnip" },
            { name = "buffer" },
            { name = "tmux" },
          }),
        })

        cmp.setup.cmdline("/", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        })

        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            { name = "cmdline" },
          }),
        })
      end,
    })
    use({
      "romgrk/barbar.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("bufferline").setup({
          clickable = false,
          closable = false,
          tabpages = false,
        })
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
        local lint = require("lint")

        lint.linters_by_ft = {
          sh = { "shellcheck" },
          ansible = { "ansible_lint" },
          dockerfile = { "hadolint" },
          markdown = { "markdownlint" },
        }

        require("xsfx.helpers").create_augroups({
          lint = {
            {
              "BufWritePost",
              {
                pattern = "*",
                callback = function()
                  require("lint").try_lint()
                end,
              },
            },
          },
        })
      end,
    })
    use({
      "mhartington/formatter.nvim",
      config = function()
        require("xsfx.helpers").create_augroups({
          format = { { "BufWritePost", { pattern = "*", command = "FormatWrite" } } },
        })

        local util = require("formatter.util")

        require("formatter").setup({
          filetype = {
            go = {
              function()
                return {
                  exe = "golines",
                  args = { "--base-formatter=gofumpt" },
                  stdin = true,
                }
              end,
            },
            proto = {
              function()
                return {
                  exe = "clang-format",
                  args = {
                    "-style='{BasedOnStyle: Google, IndentWidth: 4, AlignConsecutiveDeclarations: true, AlignConsecutiveAssignments: true, ColumnLimit: 0}'",
                  },
                  stdin = true,
                }
              end,
            },
            sql = {
              function()
                return {
                  exe = "sql-formatter",
                  args = { "-u", "-l", "postgresql" },
                  stdin = true,
                }
              end,
            },
            lua = {
              require("formatter.filetypes.lua").stylua,
            },
            yaml = {
              -- function()
              -- 	return {
              -- 		exe = "yq",
              -- 		args = {
              -- 			'"sort_keys(..)"',
              -- 			"-P"
              -- 		},
              -- 		stdin = true
              -- 	}
              -- end,
              function()
                return {
                  exe = "prettier",
                  args = {
                    "--stdin-filepath",
                    util.escape_path(util.get_current_buffer_file_path()),
                    "--single-quote",
                  },
                  stdin = true,
                }
              end,
              function()
                return {
                  exe = "kustomize cfg fmt",
                  stdin = true,
                }
              end,
            },
            taskfile = {
              require("formatter.filetypes.yaml").prettier,
            },
            sh = {
              require("formatter.filetypes.sh").shfmt,
            },
            markdown = {
              function()
                return {
                  exe = "prettier",
                  args = {
                    "--stdin-filepath",
                    vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                    "--single-quote",
                  },
                  stdin = true,
                }
              end,
            },
            json = {
              function()
                return {
                  exe = "prettier",
                  args = {
                    "--stdin-filepath",
                    vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                    "--single-quote",
                  },
                  stdin = true,
                }
              end,
            },
            javascript = {
              function()
                return {
                  exe = "prettier",
                  args = {
                    "--stdin-filepath",
                    vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                    "--single-quote",
                  },
                  stdin = true,
                }
              end,
            },
          },
        })
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
        require("fzf-lua").setup({
          winopts = {
            fullscreen = true,
          },
          files = {
            fd_opts = "--color=always --type f --hidden --no-ignore --follow --exclude .git",
          },
          grep = {
            rg_opts = "--no-ignore-vcs --hidden --column --line-number --no-heading --color=always --smart-case --max-columns=512",
          },
        })
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
    use("preservim/vimux")
    use({
      "leoluz/nvim-dap-go",
      requires = "mfussenegger/nvim-dap",
      config = function()
        require("dap-go").setup()
        vim.g.delve_use_vimux = 1
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
    if Packer_bootstrap then
      require("packer").sync()
    end
  end,
})

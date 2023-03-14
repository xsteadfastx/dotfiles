-- completions
vim.opt.completeopt = "menu,menuone,noselect"

return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"andersevenrud/cmp-tmux",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
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
					{ name = "luasnip" },
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

			local ls = require("luasnip")
			local s = ls.snippet
			-- local sn = ls.snippet_node
			-- local isn = ls.indent_snippet_node
			-- local t = ls.text_node
			local i = ls.insert_node
			-- local f = ls.function_node
			-- local c = ls.choice_node
			-- local d = ls.dynamic_node
			-- local r = ls.restore_node
			-- local events = require("luasnip.util.events")
			-- local ai = require("luasnip.nodes.absolute_indexer")
			local fmt = require("luasnip.extras.fmt").fmt
			-- local extras = require("luasnip.extras")
			-- local m = extras.m
			-- local l = extras.l
			-- local rep = extras.rep
			-- local postfix = require("luasnip.extras.postfix").postfix

			ls.setup({})

			require("luasnip.loaders.from_vscode").lazy_load()

			ls.add_snippets("go", {
				-- test tables
				s(
					"tddt",
					fmt(
						[[
				func Test<>(t *testing.T) {
					tables := []struct{
						name string
					}{
						{
							"00",
						},
					}

					for _, tt := range tables {
						tt := tt

						t.Run(tt.name, func(t *testing.T){})
					}
				}
			]],
						{ i(1) },
						{ delimiters = "<>" }
					)
				),
				-- simple if err
				s(
					"ife",
					fmt(
						[[
				if err != nil {
						return <2>fmt.Errorf("<1>: %w", err)
				}
			]],
						{ i(1), i(2) },
						{ delimiters = "<>" }
					)
				),
			})
		end,
	},
}

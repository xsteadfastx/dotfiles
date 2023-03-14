return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/nvim-cmp",
			"rafamadriz/friendly-snippets",
		},
		config = function()
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

			require("cmp").setup({
				snippet = {
					expand = function(args)
						ls.lsp_expand(args.body)
					end,
				},
			})

			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end)

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

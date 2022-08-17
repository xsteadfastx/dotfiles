local cmp = require "cmp"

cmp.setup(
	{
		snippet = {
			expand = function(args)
			end
		},
		mapping = cmp.mapping.preset.insert(
			{
				["<CR>"] = cmp.mapping.confirm({ select = true })
			}
		),
		sources = cmp.config.sources(
			{
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "tmux" }
			}
		)
	}
)

cmp.setup.cmdline(
	"/",
	{
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" }
		}
	}
)

cmp.setup.cmdline(
	":",
	{
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources(
			{
				{ name = "path" }
			},
			{
				{ name = "cmdline" }
			}
		)
	}
)

vim.g.gitblame_display_virtual_text = 0

local gitblame = require("gitblame")

require("lualine").setup({
	options = {
		theme = "dracula-nvim",
	},
	sections = {
		lualine_c = {
			{ gitblame.get_current_blame_text, cond = gitblame.is_blame_text_available },
		},
	},
})

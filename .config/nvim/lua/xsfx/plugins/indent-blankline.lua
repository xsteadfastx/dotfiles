-- adds indentation guides to all lines (including empty lines)
return {
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
}

-- adds indentation guides to all lines (including empty lines)
return {
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({})
		end,
	},
}

require("xsfx.helpers").create_augroups({
	folding = {
		{
			{ "BufReadPost", "FileReadPost" },
			{ pattern = "*", command = "normal zR" },
		},
	},
})

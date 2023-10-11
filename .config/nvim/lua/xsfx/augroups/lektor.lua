require("xsfx.helpers").create_augroups({
	lektor = {
		{
			{ "BufRead",        "BufNewFile" },
			{ pattern = "*.lr", command = "set filetype=markdown" },
		},
	},
})

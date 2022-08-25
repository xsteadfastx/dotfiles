require("xsfx.helpers").create_augroups({
	python = {
		{ { "BufRead", "BufNewFile" }, { pattern = "*.xsh", command = "set filetype=python" } },
	},
})

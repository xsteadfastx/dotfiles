require("xsfx.helpers").create_augroups({
	tex = {
		{ "FileType", { pattern = "tex", command = "call pencil#init()" } },
		{ "FileType", { pattern = "tex", command = "setl tabstop=4 expandtab shiftwidth=4 softtabstop=4" } },
	},
})

require("xsfx.helpers").create_augroups({
	css = {
		{ "BufRead,BufNewFile", { pattern = "*.scss", command = "filetype=css" } },
		{ "FileType", { pattern = "css", command = "setl tabstop=2 expandtab shiftwidth=2 softtabstop=2" } },
		{ "FileType", { pattern = "css", command = "ColorHighlight" } },
	},
})

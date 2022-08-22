require("xsfx.helpers").create_augroups({
	pencil = {
		{ "BufRead,BufNewFile", { pattern = "*.markdown,*.md", command = "set filetype=markdown" } },
		{ "FileType", { pattern = "markdown,mkd,rst", command = "call pencil#init()" } },
		{
			"FileType",
			{ pattern = "markdown,mkd,rst", command = "setl tabstop=4 expandtab shiftwidth=4 softtabstop=4" },
		},
		{ "FileType", { pattern = "markdown,mkd,rst", command = "setl syntax=off" } },
	},
})

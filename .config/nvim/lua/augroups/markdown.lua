require("helpers").create_augroups(
	{
		pencil = {
			{ "BufRead,BufNewFile", "*.markdown,*.md", "set filetype=markdown" },
			{ "FileType", "markdown,mkd,rst", "call pencil#init()" },
			{ "FileType", "markdown,mkd,rst", "setl tabstop=4 expandtab shiftwidth=4 softtabstop=4" },
			{ "FileType", "markdown,mkd,rst", "setl syntax=off" }
		}
	}
)

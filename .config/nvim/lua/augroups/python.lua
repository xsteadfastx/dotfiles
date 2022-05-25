require("helpers").create_augroups(
	{
		python = {
			{ "BufRead,BufNewFile", "*.xsh", "set filetype=python" },
			{ "FileType", "python", "colorcolumn=88" }
		}
	}
)

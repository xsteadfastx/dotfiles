require("xsfx.helpers").create_augroups(
	{
		python = {
			{ "BufRead,BufNewFile", "*.xsh", "set filetype=python" }
			-- { "FileType", "python", "set colorcolumn=88" }
		}
	}
)

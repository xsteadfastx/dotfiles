require("helpers").create_augroups(
	{
		css = {
			{ "BufRead,BufNewFile", "*.scss", "filetype=css" },
			{ "FileType", "css", "setl tabstop=2 expandtab shiftwidth=2 softtabstop=2" },
			{ "FileType", "css", "ColorHighlight" }
		}
	}
)

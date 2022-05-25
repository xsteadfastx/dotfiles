require("helpers").create_augroups(
	{
		yaml = {
			{ "BufRead,BufNewFile", "*.yml,*.yaml", "set filetype=yaml" },
			{ "FileType", "yaml", "setl tabstop=2 expandtab shiftwidth=2 softtabstop=2" }
		}
	}
)

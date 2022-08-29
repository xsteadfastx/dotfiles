require("xsfx.helpers").create_augroups({
	yaml = {
		{ { "BufRead", "BufNewFile" }, { pattern = "*.yml,*.yaml", command = "set filetype=yaml" } },
		{ "FileType", { pattern = "yaml", command = "setl tabstop=2 expandtab shiftwidth=2 softtabstop=2" } },
		{
			{ "BufNewFile", "BufRead" },
			{ pattern = "Taskfile.yml,Taskfile_*.yml", command = "setl ft=taskfile syntax=yaml" },
		},
		{
			"FileType",
			{ pattern = "taskfile", command = "setl tabstop=2 expandtab shiftwidth=2 softtabstop=2 syntax=yaml" },
		},
	},
})

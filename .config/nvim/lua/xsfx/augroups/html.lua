require("xsfx.helpers").create_augroups({
	html = {
		{ "FileType", { pattern = "html", command = "setl sw=2 ts=2 sts=2" } },
		{ "FileType", { pattern = "htmldjango", command = "setl sw=2 ts=2 sts=2" } },
	},
})

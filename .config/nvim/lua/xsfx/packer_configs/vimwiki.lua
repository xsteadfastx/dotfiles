vim.g["vimwiki_list"] = { { path = "~/permanent/vimwiki/", syntax = "markdown", ext = ".md", index = "Home" } }
vim.g["vimwiki_global_ext"] = 0

require("xsfx.helpers").create_augroups({
	wiki = {
		{ "FileType", { pattern = "vimwiki", command = "call pencil#init()" } },
		{
			"FileType",
			{ pattern = "vimwiki", command = "setl tabstop=4 expandtab shiftwidth=4 softtabstop=4" },
		},
	},
})

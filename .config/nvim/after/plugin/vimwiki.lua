local g = vim.g

g["vimwiki_list"] = { { path = "~/permanent/vimwiki/", syntax = "markdown", ext = ".md", index = "Home" } }
g["vimwiki_global_ext"] = 0

require("xsfx.helpers").create_augroups(
	{
		wiki = {
			{ "FileType", "vimwiki", "call pencil#init()" },
			{ "FileType", "vimwiki", "setl tabstop=4 expandtab shiftwidth=4 softtabstop=4" }
		}
	}
)

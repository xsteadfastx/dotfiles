vim.filetype.add({
	extension = {
		lr = "markdown",
		xsh = "python",
		templ = "templ",
	},

	pattern = {
		[vim.fn.expand("~") .. "/.tasks/.*%.ya?ml"] = "taskfile",
		["[tT]askfile%.ya?ml"] = "taskfile",
		["[tT]askfile_.+%.ya?ml"] = "taskfile",
	},
})

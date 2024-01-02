vim.filetype.add({
	pattern = {
		[vim.fn.expand("~") .. "/.tasks/.*.yaml"] = "taskfile",
		[vim.fn.expand("~") .. "/.tasks/.*.yml"] = "taskfile",
	},

	filename = {
		["Taskfile.yml"] = "taskfile",
		["Taskfile.yaml"] = "taskfile",
	},
})

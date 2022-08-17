local lint = require("lint")

lint.linters_by_ft = {
	sh = { "shellcheck" },
	ansible = { "ansible_lint" },
	dockerfile = { "hadolint" },
}

require("helpers").create_augroups({ format = { { "BufWritePost", "*", "lua require('lint').try_lint()" } } })

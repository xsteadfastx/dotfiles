local lint = require "lint"

lint.linters_by_ft = {
	sh = { "shellcheck" },
	ansible = { "ansible_lint" }
}

require("helpers").create_augroups({ lint = { { "BufWritePost", "<buffer>", "lua require('lint').try_lint()" } } })

local lint = require("lint")

lint.linters_by_ft = {
	sh = { "shellcheck" },
	ansible = { "ansible_lint" },
	dockerfile = { "hadolint" },
	markdown = { "markdownlint" },
}

require("xsfx.helpers").create_augroups({
	lint = { { "BufWritePost", {
		pattern = "*",
		callback = function()
			require("lint").try_lint()
		end,
	} } },
})

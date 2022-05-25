function OrgImports(wait_ms) -- from https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-imports
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

require("helpers").create_augroups({ format = { { "BufWritePost", "*", "FormatWrite" } } })
require("helpers").create_augroups({ lsp_format = { { "BufWritePre", "*", "lua vim.lsp.buf.formatting_seq_sync()" } } })
require("helpers").create_augroups({ org_imports = { { "BufWritePre", "*.go", "lua OrgImports(1000)" } } })

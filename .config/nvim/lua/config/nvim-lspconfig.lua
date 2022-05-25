local lspinstaller = require("nvim-lsp-installer")
lspinstaller.setup {}

local lspconfig = require("lspconfig")

-- individuell lsp configs
lspconfig.gopls.setup {
	init_options = {
		buildFlags = { "-tags=integration,tools" },
		gofumpt = true
	}
}

lspconfig.sumneko_lua.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	}
}

-- setup the rest
for _, server in ipairs(lspinstaller.get_installed_servers()) do
	if server.name ~= "sumneko_lua" and server.name ~= "gopls" then
		lspconfig[server.name].setup {}
	end
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover,
	{
		border = "single"
	}
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
	vim.lsp.handlers.signature_help,
	{
		border = "single"
	}
)

-- completions
require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

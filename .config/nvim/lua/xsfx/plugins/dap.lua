return {
	-- debug Adapter Protocol client implementation
	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
		keys = {
			{ "<Leader>dt",  ":lua require('dap-go').debug_test()<CR>" },
			{ "<F5>",        ":lua require'dap'.continue()<CR>" },
			{ "<F10>",       ":lua require'dap'.step_over()<CR>" },
			{ "<F11>",       ":lua require'dap'.step_into()<CR>" },
			{ "<F12>",       ":lua require'dap'.step_out()<CR>" },
			{ "<Leader>b",   ":lua require'dap'.toggle_breakpoint()<CR>" },
			{ "<Leader>B",   ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')<CR>" },
			{ "<Leader>lp",  ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>" },
			{ "<Leader>dr",  ":lua require'dap'.repl.open()<CR>" },
			{ "<Leader>dl",  ":lua require'dap'.run_last()<CR>" },
			{ "<Leader>db",  ":lua require('fzf-lua').dap_breakpoints()<CR>" },
			{ "<Leader>dv",  ":lua require('fzf-lua').dap_variables()<CR>" },
			{ "<Leader>df",  ":lua require('fzf-lua').dap_frames()<CR>" },
			{ "<Leader>dui", ":lua require('dapui').toggle()<CR>" },
		},
		config = function()
			require("dap-go").setup()

			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()

			-- auto starting dapui
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}

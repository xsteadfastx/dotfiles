return {
	-- debug Adapter Protocol client implementation
	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
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

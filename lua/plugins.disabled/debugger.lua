-- Debugger with DAP
return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		-- Creates the debugger UI
		"rcarriga/nvim-dap-ui",
		-- Automated tests?
		"nvim-neotest/nvim-nio",
		-- Installs debug adapters
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		-- Add debuggers
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			-- Best effort setup of debuggers
			automatic_setup = true,
			ensure_installed = {
				"delve",
				"debugpy",
			},
		})

		-- Basic debugging keymaps
		vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Breakpoint" })

		-- Dap UI setup
		-- For more information, see |:help nvim-dap-ui|
		dapui.setup({})

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- Set up debuggers
		require("dap-go").setup()
		require("dap-python").setup()
	end,
}

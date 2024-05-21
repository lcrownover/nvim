-- lsp errors in quickfix list
return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{ "<leader>tt", ":TroubleToggle<cr>", { desc = "Toggle trouble" } },
	},
}

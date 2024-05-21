-- Copilot
return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	-- currently disabled unless i specifically load it
	-- event = { "BufRead", "BufNewFile" },
	config = function()
		require("copilot").setup({
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<A-;>",
					dismiss = "<A-BS>",
				},
			},
			filetypes = {
				yaml = true,
			},
		})
	end,
}

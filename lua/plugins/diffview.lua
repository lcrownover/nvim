-- Diffview (I don't ever use this...)
return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = true,
}

-- this flashes the current selection when I yank it
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({
			-- higroup = "IncSearch",
			-- timeout = 100,
		})
	end,
})

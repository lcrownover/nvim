-- centering screen on next find results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- better joining
vim.keymap.set("n", "J", "mzJ`z")

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- keep visual mode after indenting
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "<", "<gv")

-- break undo sequence after punctuation
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")

-- splits
vim.keymap.set("n", "<c-w>-", ":split<cr>", { desc = "Horizontal split" })
vim.keymap.set("n", "<c-w>\\", ":vsplit<cr>", { desc = "Vertical split" })
vim.keymap.set("n", "<c-w>w", ":close<cr>", { desc = "Close split" })

-- toggle showing of whitespace characters
vim.keymap.set("n", "<leader>sw", ToggleWhitespaceVisibility, { desc = "Toggle whitespace visibility" })

-- close the quickfix window
-- vim.keymap.set("n", "<leader>qf", ":copen<cr>", { desc = "Open quickfix window" })
-- vim.keymap.set("n", "<leader>qc", ":cclose<cr>", { desc = "Close quickfix window" })

-- scratch buffers, normal or splits
vim.keymap.set("n", "<leader>nn", ":enew<cr>", { desc = "New scratch buffer" })
vim.keymap.set("n", "<leader>nv", ":vnew<cr>", { desc = "New scratch buffer (vertical)" })
vim.keymap.set("n", "<leader>nh", ":new<cr>", { desc = "New scratch buffer (horizontal)" })

-- toggle sign column for copy-paste
vim.keymap.set("n", "<leader>nu", ":set invnu<cr>:set invrnu<cr>", { desc = "Toggle line numbers" })

-- close buffer
vim.keymap.set("n", "<leader>w", ":bd<cr>", { desc = "Close buffer" })

-- quick key for regex
vim.keymap.set("n", "<leader>r", ":%s/", { desc = "Search and replace entire buffer" })
vim.keymap.set("x", "<leader>r", ":s/", { desc = "Search and replace selection" })

-- builtin diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- toggle copilot
vim.keymap.set("n", "<leader>ct", ":Copilot toggle<cr>", { desc = "Copilot Toggle" })

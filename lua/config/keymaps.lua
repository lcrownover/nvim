-- centering screen on next find results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- clear hl on esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

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

-- lazygit
-- vim.keymap.set('n', '<leader>gg', ':terminal lazygit<CR>', { desc = "Open Lazygit in a Terminal" })

-- close the quickfix window
-- vim.keymap.set("n", "<leader>qf", ":copen<cr>", { desc = "Open quickfix window" })
-- vim.keymap.set("n", "<leader>qc", ":cclose<cr>", { desc = "Close quickfix window" })

-- scratch buffers, normal or splits
vim.keymap.set("n", "<leader>nn", ":enew<cr>", { desc = "New scratch buffer" })
vim.keymap.set("n", "<leader>nv", ":vnew<cr>", { desc = "New scratch buffer (vertical)" })
vim.keymap.set("n", "<leader>nh", ":new<cr>", { desc = "New scratch buffer (horizontal)" })

-- toggle sign column for copy-paste
-- vim.keymap.set("n", "<leader>nu", ":set invnu<cr>:set invrnu<cr>", { desc = "Toggle line numbers" })

-- close buffer
vim.keymap.set("n", "<leader>w", ":bd<cr>", { desc = "Close buffer" })

-- quick key for regex
vim.keymap.set("n", "<leader>r", ":%s/", { desc = "Search and replace entire buffer" })
vim.keymap.set("x", "<leader>r", ":s/", { desc = "Search and replace selection" })

-- builtin diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })

-- formatting code (use LSP, fallback to conform.nvim)
vim.keymap.set("n", "<leader>fs", Format, { desc = "LSP Format", silent = true })

-- toggle copilot
-- vim.keymap.set("n", "<leader>ct", ":Copilot toggle<cr>", { desc = "Copilot Toggle" })

-- Go
vim.keymap.set("n", "<leader>lbt", ":lua GoSetBuildTags()<cr>", { desc = "Go - Set Build Tags" })

-- Quickfix
vim.keymap.set("n", "<leader>q", function() require("quicker").toggle() end, { desc = "Toggle quickfix", })

-- Git
local snacks = require('snacks')
vim.keymap.set("n", "<leader>gb", function() snacks.git.blame_line() end, { desc = "Git Blame Line" })
vim.keymap.set("n", "<leader>gf", function() snacks.lazygit.log_file() end, { desc = "Lazygit Current File History" })
vim.keymap.set("n", "<leader>gg", function() snacks.lazygit() end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>gl", function() snacks.lazygit.log() end, { desc = "Lazygit Log (cwd)" })

-- Pickers
local fzf = require("fzf-lua")
vim.keymap.set("n", "<c-p>", fzf.files, { desc = "Find files" })
vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })
vim.keymap.set("n", "<c-g>", fzf.live_grep, { desc = "Find grep" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Find grep" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fd", fzf.diagnostics_workspace, { desc = "Find diagnostics" })
vim.keymap.set("n", "<leader>fh", fzf.manpages, { desc = "Find help tags" })
vim.keymap.set("n", "<leader>f;", fzf.resume, { desc = "Find resume" })
vim.keymap.set("n", "<leader>fq", fzf.quickfix, { desc = "Find quickfix" })
vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "Find keymaps" })
vim.keymap.set("n", "<leader>fa", fzf.autocmds, { desc = "Find autocommands" })
vim.keymap.set("n", "<leader>fc", fzf.highlights, { desc = "Find colors (highlights)" })
vim.keymap.set("n", "<leader>fl", fzf.git_commits, { desc = "Find git commits" })
-- LSP specific pickers
vim.keymap.set('n', "gd", fzf.lsp_definitions, { desc = "LSP: Goto Definition" })
vim.keymap.set('n', "gD", vim.lsp.buf.declaration, { desc = "LSP: Goto Declaration" })
vim.keymap.set('n', "gr", fzf.lsp_references, { desc = "LSP: Goto References" })
vim.keymap.set('n', "gi", fzf.lsp_implementations, { desc = "LSP: Goto Implementations" })
vim.keymap.set('n', "<leader>ls", fzf.lsp_document_symbols, { desc = "LSP: Document Symbols" })
vim.keymap.set('n', "<leader>lr", ":LspRestart<cr>", { desc = "LSP: Restart LSP server" })
vim.keymap.set('n', "<leader>li", ":LspInfo<cr>", { desc = "LSP: Show LSP info" })
vim.keymap.set('n', "<leader>lh", ":ToggleInlayHints<cr>", { desc = "LSP: Toggle LSP inlay hints" })
vim.keymap.set('n', "gn", vim.lsp.buf.rename, { desc = "LSP: Rename Symbol" })
vim.keymap.set('n', "<F2>", vim.lsp.buf.rename, { desc = "LSP: Rename Symbol" })
vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })

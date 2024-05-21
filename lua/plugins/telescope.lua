-- Telescope! The best fuzzy finder
return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		local file_ignore_patterns = {
			"node_modules",
			"Music",
			"Library",
			"venv",
		}
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = file_ignore_patterns,
				mappings = {
					i = {
						["<c-k>"] = require("telescope.actions").move_selection_previous,
						["<c-j>"] = require("telescope.actions").move_selection_next,
					},
				},
			},
			pickers = {
				buffers = {
					mappings = {
						n = { ["x"] = require("telescope.actions").delete_buffer },
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})
		-- enable telescope extensions
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<c-p>", function()
			builtin.find_files({ follow = true })
		end, { desc = "Find files" })
		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ follow = true })
		end, { desc = "Find files" })
		vim.keymap.set("n", "<c-g>", builtin.live_grep, { desc = "Find grep" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
		vim.keymap.set("n", "<leader>f;", builtin.resume, { desc = "Find resume" })
		vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Find quickfix" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
		vim.keymap.set("n", "<leader>fa", builtin.autocommands, { desc = "Find autocommands" })
		vim.keymap.set("n", "<leader>fc", builtin.highlights, { desc = "Find colors (highlights)" })
		vim.keymap.set("n", "<leader>fl", builtin.git_commits, { desc = "Find git commits" })
		vim.keymap.set("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "Find in current buffer" })
	end,
}

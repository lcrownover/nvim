return {
	"mfussenegger/nvim-lint",
	event = "BufRead",
	config = function()
		require("lint").linters_by_ft = {
			ansible = { "ansible_lint" },
			yaml = { "ansible_lint", "yamllint" },
			python = { "mypy", "ruff" },
			lua = { "luacheck" },
			sh = { "shellcheck" },
			markdown = { "vale" },
		}

		vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}

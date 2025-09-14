return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			default_format_opts = {
				lsp_format = "prefer",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = function(bufnr)
					if require("conform").get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,
				sh = { "shfmt" },
				markdown = { "markdownlint" },
				yaml = { "yamlfix" },
				go = { "goimports", "gofmt" },
				["_"] = { "trim_whitespace" },
			},
		})
	end,
}

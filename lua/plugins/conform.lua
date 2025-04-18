return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
				sh = { "shfmt" },
				markdown = { "markdownlint" },
				yaml = { "yamlfix" },
        go = { "gofmt" },
			},
		})
	end,
}

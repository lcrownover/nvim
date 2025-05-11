return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
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
        ["*"] = { "trim_whitespace" },
      },
    })
  end,
}

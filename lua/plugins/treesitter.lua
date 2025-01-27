-- Treesitter!
return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufEnter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "markdown", "markdown_inline" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

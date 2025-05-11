-- Treesitter!
return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufEnter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = "all",
      auto_install = true,
    })
  end,
}

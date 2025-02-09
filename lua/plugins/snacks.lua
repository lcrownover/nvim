return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    'echasnovski/mini.icons',
  },
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    indent = {
      enabled = true,
      animate = {
        enabled = false,
      }
    },
    input = { enabled = false },
    notifier = {
      enabled = true,
      timeout = 3000
    },
    quickfile = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = true },
    picker = { enabled = true },
  },
}

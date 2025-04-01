-- Copilot
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = true, -- Enable debugging
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<A-;>",
            dismiss = "<A-BS>",
          },
        },
        filetypes = {
          yaml = true,
        },
      })
    end,
  }
}

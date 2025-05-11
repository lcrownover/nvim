-- Copilot
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
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

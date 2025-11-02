-- Copilot
return {
  "zbirenbaum/copilot.lua",
  requires = { "copilotlsp-nvim/copilot-lsp" },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = false,
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

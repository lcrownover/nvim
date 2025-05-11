return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
    })
  end
}

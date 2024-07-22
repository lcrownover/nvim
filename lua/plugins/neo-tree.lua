-- File tree
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<c-b>",     ":Neotree toggle<CR>", silent = true, desc = "Toggle neo-tree" },
        { "<leader>b", ":Neotree reveal<CR>", silent = true, desc = "Reveal active file with neo-tree" },
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            window = {
                width = 50,
                position = "right",
                mappings = {
                    ["<C-b>"] = false,
                    ["<C-f>"] = false,
                },
            },
            event_handlers = {
                {
                    event = "file_opened",
                    handler = function(_)
                        require("neo-tree.command").execute({ action = "close" })
                    end,
                },
            },
        })
    end,
}

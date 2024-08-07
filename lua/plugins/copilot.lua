-- Copilot
return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        keys = {
            {"<leader>cc", ":lua CopilotChatOpen<cr>", desc = "Copilot Chat"}
        },
        branch = "canary",
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
        -- currently disabled unless i specifically load it
        -- event = { "BufRead", "BufNewFile" },
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

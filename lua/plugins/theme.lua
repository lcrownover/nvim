-- {
-- 	"sainnhe/gruvbox-material",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.gruvbox_material_background = "medium"
-- 		vim.g.gruvbox_material_enable_italic = 1
-- 		vim.g.gruvbox_material_better_performance = 1
-- 		vim.cmd.colorscheme("gruvbox-material")
-- 		vim.g.lualine_theme = "gruvbox-material"
-- 	end,
-- },
--
return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            -- styles = {
            --   keywords = { italic = false },
            -- }
        })
        vim.cmd.colorscheme("tokyonight")
        vim.g.lualine_theme = "tokyonight"
    end,
}
-- return {
-- "sainnhe/everforest",
-- lazy = false,
-- priority = 1000,
-- config = function()
-- 	vim.g.everforest_background = "hard"
-- 	vim.g.everforest_better_performance = 1
-- 	vim.cmd([[colorscheme everforest]])
-- 	vim.g.lualine_theme = "everforest"
-- end,
-- }
-- return {
--     "rose-pine/neovim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
--         require("rose-pine").setup()
--         vim.cmd("colorscheme rose-pine")
-- 	end,
-- }
-- return {
--     'AlexvZyl/nordic.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require 'nordic'.load()
--     end
-- }
-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("catppuccin").setup({
--             flavour = "mocha",
--             -- flavour = "macchiato",
--         })
--         vim.cmd.colorscheme "catppuccin"
--     end
-- }
-- return {
--     'loctvl842/monokai-pro.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("monokai-pro").setup()
--         vim.cmd([[colorscheme monokai-pro]])
--     end
-- }
-- return {}

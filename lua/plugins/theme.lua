-- return {
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
-- }
--

-- return {
--   "sainnhe/sonokai",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.sonokai_enable_italic = true
--     vim.g.lualine_theme = "sonokai"
--     vim.cmd.colorscheme("sonokai")
--   end,
-- }
--
-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("tokyonight").setup({
--       style = "storm",
--       styles = {
--         keywords = { italic = false },
--       }
--     })
--     vim.cmd.colorscheme("tokyonight")
--     vim.g.lualine_theme = "tokyonight"
--   end,
-- }

-- return {
--   "rebelot/kanagawa.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("kanagawa")
--     vim.g.lualine_theme = "kanagawa"
--   end
-- }


-- return {
--     "Shatur/neovim-ayu",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require('ayu').setup({
--             mirage = false,  -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
--             terminal = true, -- Set to `false` to let terminal manage its own colors.
--             overrides = {},  -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
--         })
--         vim.g.lualine_theme = "ayu"
--         vim.cmd.colorscheme("ayu")
--     end
-- }
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
--   'AlexvZyl/nordic.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.lualine_theme = "nordic"
--     require 'nordic'.load()
--   end
-- }
-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("catppuccin").setup({
--             -- flavour = "mocha",
--             -- flavour = "macchiato",
--             flavour = "frappe",
--         })
--         vim.cmd.colorscheme "catppuccin"
--     end
-- }
return {
  'khoido2003/monokai-v2.nvim',
  -- dir = "/Users/lcrown/repos/monokai-pro.nvim",
  -- dev = true,
  lazy = false,
  priority = 1000,
  config = function()
    require("monokai-v2").setup({
      -- filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    })
    vim.cmd([[colorscheme monokai-v2]])
  end
}
-- return {
--   "EdenEast/nightfox.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.lualine_theme = "nightfox"
--     vim.cmd("colorscheme nightfox")
--   end
-- }
-- return {
--   'navarasu/onedark.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('onedark').load()
--   end
-- }
-- return {
--     'cpea2506/one_monokai.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("one_monokai").setup({})
--         vim.cmd([[colorscheme one_monokai]])
--     end
-- }

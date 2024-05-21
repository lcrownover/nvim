-- Completion
return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"windwp/nvim-autopairs",
		-- snippet support
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			depedenencies = {
				"rafamadriz/friendly-snippets",
			},
			build = "make install_jsregexp",
			config = function()
				require("luasnip/loaders/from_vscode").lazy_load()
			end,
		},
		-- completion sources
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		-- completion icons
		"onsails/lspkind-nvim",
		-- copilot
		-- "zbirenbaum/copilot-cmp",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noselect",
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
			}),
			-- sources for autocompletion
			sources = {
				-- { name = "nvim_lsp_signature_help" },
				{ name = "nvim_lsp" },
				{ name = "path" },
				-- { name = "luasnip" },
				-- { name = "copilot" },
				{ name = "buffer" },
			},
			-- hover doc fix
			view = {
				entries = {
					vertical_positioning = "above",
				},
			},
			-- configure completion icons
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 50,
					ellipsis_char = "...",
					symbol_map = {
						Copilot = "",
					},
				}),
			},
			min_length = 0, -- allow for `from package import _` in Python
		})

		-- make autopairs and completion work together
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}

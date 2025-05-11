-- LSP and LSP accessories
return {
	"neovim/nvim-lspconfig",
	event = { "BufRead", "BufNewFile" },
	dependencies = {
		{ "j-hui/fidget.nvim", opts = {} },
		"saghen/blink.cmp",
	},
	config = function()
		-- Any .yml file is treated as though it's Ansible
		vim.filetype.add({
			extension = {
				yml = "ansible",
			},
		})

		-- Now configure LSP servers
		local servers = {
			bashls = {},
			html = {},
			marksman = {},
			pyright = {},
      ts_ls = {},
			ansiblels = {
				filetypes = {
					"ansible",
				},
			},
			gopls = {
				settings = {
					gopls = {
						staticcheck = true,
						buildFlags = { "-tags=2411" },
					},
				},
			},
			rust_analyzer = {
				tools = {
					inlay_hints = {
						auto = false,
					},
				},
			},
			terraformls = {},
			svelte = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							disable = { "missing-fields" },
							globals = { "vim", "Format", "Snacks", "ToggleWhitespaceVisibility" },
						},
						runtime = { version = "LuaJIT" },
						workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
					},
				},
			},
		}

		for server, config in pairs(servers) do
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end
	end,
}

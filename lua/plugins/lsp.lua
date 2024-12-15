-- LSP and LSP accessories
return {
	"neovim/nvim-lspconfig",
	event = { "BufRead", "BufNewFile" },
	opts = {
		-- inlay_hints = { enable = true },
		servers = {
			bashls = {},
			html = {},
			marksman = {},
			ruff = {},
            ansiblels = {
                filetypes = {
                    "ansible",
                },
            },
			gopls = {
				settings = {
					gopls = {
						staticcheck = true,
						buildFlags = { "-tags=2311" }
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
			terraformls = {
				filetypes = {
					"terraform",
					"tf",
				},
			},
			svelte = {},
			lua_ls = {
				settings = {
					Lua = {
						format = { enable = true },
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							disable = { "missing-fields" },
							globals = { "vim" },
						},
					},
				},
			},
		}
	},
	dependencies = {
		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim", opts = {} },
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		'saghen/blink.cmp',
	},
	config = function(_, opts)
		-- Set up neodev first
		require('neodev').setup({})

        -- Any .yml file is treated as though it's Ansible
        vim.filetype.add({
            extension = {
                yml = "ansible"
            }
        })

		local ensure_installed = {
			-- LSP Servers
			"bashls",
			"clangd",
			"html",
			"marksman",
			"ruff",
			"ansiblels",
			"gopls",
			"rust_analyzer",
			"terraformls",
			"svelte",
			"lua_ls",
			-- Tools
			"prettier",
			"prettierd",
			"stylua",
			"luacheck",
			"isort",
			"mypy",
			"ruff",
			"eslint_d",
			"ansible-lint",
			"shfmt",
			"shellcheck",
			"markdownlint",
			"vale",
			"yamlfix",
			"yamllint",
		}

		require("mason").setup({})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
			run_on_start = true,
		})

		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
			config.capabilties = vim.tbl_deep_extend("force", lsp_capabilities,
				require('blink.cmp').get_lsp_capabilities(config.capabilities))
			lspconfig[server].setup(config)
		end
	end
}

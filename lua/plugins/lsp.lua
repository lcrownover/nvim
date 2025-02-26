-- LSP and LSP accessories
return {
  "neovim/nvim-lspconfig",
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    { "j-hui/fidget.nvim", opts = {} },
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    'saghen/blink.cmp',
  },
  config = function()
    -- Install tools with Mason first
    local ensure_installed = {
      -- LSP Servers
      "bash-language-server",
      "html-lsp",
      "marksman",
      "pyright",
      "ansible-language-server",
      "gopls",
      "rust-analyzer",
      "terraform-ls",
      "svelte-language-server",
      "lua-language-server",
      -- Tools
      "prettier",
      "prettierd",
      "stylua",
      "luacheck",
      "isort",
      "mypy",
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

    -- Any .yml file is treated as though it's Ansible
    vim.filetype.add({
      extension = {
        yml = "ansible"
      }
    })

    -- Now configure LSP servers
    local servers = {
      bashls = {},
      html = {},
      marksman = {},
      pyright = {},
      ansiblels = {
        filetypes = {
          "ansible"
        }
      },
      gopls = {
        settings = {
          gopls = {
            staticcheck = true,
            -- buildFlags = { "-tags=2311" }
          }
        },
      },
      rust_analyzer = {
        tools = {
          inlay_hints = {
            auto = false
          }
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
              globals = { "vim" },
            },
            runtime = { version = 'LuaJIT' },
            workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } }
          },
        },
      },

    }

    for server, config in pairs(servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      require("lspconfig")[server].setup(config)
    end
  end
}

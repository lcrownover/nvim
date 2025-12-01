-- LSP and LSP accessories
return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    local default_config = { inlay_hints = { enabled = false } }
    -- Now configure LSP servers
    local servers = {
      bashls = default_config,
      html = default_config,
      marksman = default_config,
      pyright = default_config,
      ts_ls = default_config,
      gopls = vim.tbl_deep_extend("force", default_config, {
        settings = {
          gopls = {
            staticcheck = true,
            -- buildFlags = { "-tags=2411" },
          },
        },
      }),
      rust_analyzer = vim.tbl_deep_extend("force", default_config, {
        tools = {
          inlay_hints = {
            auto = false,
          },
        },
      }),
      terraformls = default_config,
      svelte = default_config,
      lua_ls = vim.tbl_deep_extend("force", default_config, {
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
      }),
    }

    for server, config in pairs(servers) do
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end,
}

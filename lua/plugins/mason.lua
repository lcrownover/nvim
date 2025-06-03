-- Mason for installing language stuff
return {
  "williamboman/mason.nvim",
  lazy = false,
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local ensure_installed = {
      -- LSP Servers
      "bash-language-server",
      "html-lsp",
      "marksman",
      "pyright",
      -- "ansible-language-server",
      "gopls",
      "rust-analyzer",
      "terraform-ls",
      "svelte-language-server",
      "typescript-language-server",
      "lua-language-server",
      -- Tools
      "prettier",
      "prettierd",
      "stylua",
      "luacheck",
      "isort",
      "mypy",
      "eslint_d",
      -- "ansible-lint",
      "shfmt",
      "shellcheck",
      "markdownlint",
      "vale",
      "yamlfix",
      "yamllint",
    }

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed,
      run_on_start = true,
    })
  end
}

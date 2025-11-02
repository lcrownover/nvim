return {
  "mfussenegger/nvim-lint",
  event = "BufRead",
  config = function()
    local lint = require('lint')

    lint.linters.luacheck = vim.tbl_deep_extend('force', lint.linters.luacheck, {
      cmd = "luacheck",
      args = { '--formatter', 'plain', '--codes', '--ranges', "--globals", "vim", "-", },
    })

    lint.linters_by_ft = {
      -- ansible = { "ansible_lint" },
      yaml = { "yamllint" },
      python = { "ruff" },
      lua = { "luacheck" },
      sh = { "shellcheck" },
      markdown = { "vale" },
    }

    vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}

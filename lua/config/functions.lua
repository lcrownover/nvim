-- this will toggle the visibility of whitespace characters
function ToggleWhitespaceVisibility()
  vim.opt.list = not vim.opt.list:get()
end

-- this uses the LSP formatter if it exists,
-- otherwise uses conform.nvim
-- function Format()
--   for _, client in pairs(vim.lsp.get_clients()) do
--     if client:supports_method("textDocument/formatting") then
--       return vim.lsp.buf.format({ async = true })
--     end
--   end
--   require("conform").format({ async = true })
-- end

function Tprint(tbl, indent)
  if not indent then
    indent = 0
  end
  for k, v in pairs(tbl) do
    local formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      Tprint(v, indent + 1)
    else
      print(formatting .. tostring(v))
    end
  end
end

function ClearQuickfixList()
  vim.cmd [[call setqflist([])]]
end

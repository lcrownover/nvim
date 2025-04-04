-- this will toggle the visibility of whitespace characters
function ToggleWhitespaceVisibility()
  vim.opt.list = not vim.opt.list:get()
end

-- this uses the LSP formatter if it exists,
-- otherwise uses conform.nvim
function Format()
  -- get the first lsp client
  -- if you have multiple lsp clients attached to the buffer then you need to handle that case
  local client = vim.lsp.get_clients({ bufnr = 0 })[1]
  if client and client.supports_method("textDocument/formatting") then
    vim.lsp.buf.format()
  else
    require("conform").format({ bufnr = 0 })
  end
end

function GoSetBuildTags()
  local client_id = 1
  local client = vim.lsp.get_client_by_id(client_id)
  if client and client.name == "gopls" then
    vim.ui.input({ prompt = "Enter build tags: " }, function(input)
      if input then
        client.config.settings.gopls.buildFlags = { "-tags=" .. input }
        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        print("Updated gopls buildFlags to: -tags=" .. input)
      else
        print("No input provided")
      end
    end)
  else
    print("gopls client not found")
  end
end

function ToggleInlayHints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end

function Tprint(tbl, indent)
  if not indent then indent = 0 end
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

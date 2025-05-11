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

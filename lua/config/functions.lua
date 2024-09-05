-- this will toggle the visibility of whitespace characters
function ToggleWhitespaceVisibility()
    vim.opt.list = not vim.opt.list:get()
end

-- this uses the LSP formatter if it exists,
-- otherwise uses conform.nvim
function Format()
    -- get the first lsp client
    -- if you have multiple lsp clients attached to the buffer then you need to handle that case
    local client = vim.lsp.get_active_clients({ bufnr = 0 })[1]

    if client and client.supports_method("textDocument/formatting") then
        vim.lsp.buf.format()
    else
        require("conform").format({ bufnr = 0 })
    end
end

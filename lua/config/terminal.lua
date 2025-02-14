-- function for terminal tab
function Switch_or_new_tab_with_term()
  local tab_count = vim.fn.tabpagenr('$') -- Get the number of tabs
  if tab_count > 1 then
    vim.cmd('tabnext')
  else
    vim.cmd('tabnew | term')
  end
end

-- escape in terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set('n', '<c-t>', ':lua Switch_or_new_tab_with_term()<cr>', { silent = true })
vim.keymap.set('t', '<c-t>', "<C-\\><C-n>:tabprev<CR>", { silent = true })
-- settings for terminal buffers
--
local augroup = vim.api.nvim_create_augroup("custom - term - open", {})

vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0
  end,
})

vim.api.nvim_create_autocmd({ "TermOpen", "WinEnter" }, {
  pattern = "term://*",
  group = augroup,
  command = "startinsert"
})

-- this will toggle the visibility of whitespace characters
function ToggleWhitespaceVisibility()
	vim.opt.list = not vim.opt.list:get()
end

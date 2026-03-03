local function fidget_setup()
	require('fidget').setup({ notification = { override_vim_notify = true } })
end
vim.api.nvim_create_autocmd('UIEnter', {
	group = vim.api.nvim_create_augroup('plugin.fidget', { clear = trueL }),
	once = true,
	callback = function() vim.schedule(fidget_setup) end,
})

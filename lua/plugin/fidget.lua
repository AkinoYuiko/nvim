vim.api.nvim_create_autocmd('UIEnter', {
	group = vim.api.nvim_create_augroup('plugin.fidget', { clear = trueL }),
	once = true,
	callback = function()
		vim.schedule(function()
			vim.pack.add({ 'https://github.com/j-hui/fidget.nvim' }, { confirm = false })
			require('fidget').setup({ notification = { override_vim_notify = true } })
		end)
	end,
})

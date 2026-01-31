vim.api.nvim_create_autocmd('UIEnter', {
	group = vim.api.nvim_create_augroup('flash.nvim', { clear = true }),
	once = true,
	callback = function()
		vim.schedule(function()
			vim.pack.add({ 'https://github.com/folke/flash.nvim' }, { confirm = false })
			require('flash'):setup()
			require('keymap.flash')
		end)
	end,
})

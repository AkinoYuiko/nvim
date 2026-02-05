vim.pack.add({ 'https://github.com/windwp/nvim-autopairs' }, {
	load = function(pack)
		vim.api.nvim_create_autocmd('InsertEnter', {
			group = vim.api.nvim_create_augroup('nvim-autopairs', { clear = true }),
			once = true,
			callback = function()
				vim.cmd.packadd(pack.spec.name)
				vim.schedule(function() require('nvim-autopairs').setup({}) end)
			end,
		})
	end,
})

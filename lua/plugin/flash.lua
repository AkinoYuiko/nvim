vim.pack.add({ 'https://github.com/folke/flash.nvim' }, {
	confirm = false,
	load = function(pack)
		vim.api.nvim_create_autocmd('VimEnter', {
			group = vim.api.nvim_create_augroup('flash.nvim', { clear = true }),
			once = true,
			callback = function()
				vim.schedule(function()
					vim.cmd.packadd(pack.spec.name)
					require('flash'):setup()
					require('keymap.flash')
				end)
			end,
		})
	end,
})

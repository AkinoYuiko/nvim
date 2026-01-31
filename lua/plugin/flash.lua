vim.api.nvim_create_autocmd('UIEnter', {
	group = vim.api.nvim_create_augroup('flash.nvim', { clear = true }),
	once = true,
	callback = function()
		vim.schedule(function()
			vim.pack.add({ 'https://github.com/folke/flash.nvim' }, { confirm = false })
			require('flash'):setup()
			require('core.keymap').map({
				{ 's', function() require('flash').jump() end, mode = { 'n', 'x', 'o' }, desc = 'Flash' },
				{ 'S', function() require('flash').treesitter() end, mode = { 'n', 'x', 'o' }, desc = 'Flash Treesitter' },
				{ 'r', function() require('flash').remote() end, mode = 'o', desc = 'Remote Flash' },
				{ 'R', function() require('flash').treesitter_search() end, mode = { 'o', 'x' }, desc = 'Treesitter Search' },
				{ '<c-s>', function() require('flash').toggle() end, mode = { 'c' }, desc = 'Toggle Flash Search' },
			})
		end)
	end,
})

local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup('nvim-treesitter', { clear = true })
-- nvim-treesitter
autocmd('UIEnter', {
	group = group,
	once = true,
	callback = function()
		vim.schedule(function()
			vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' }, { confirm = false })
			autocmd('PackChanged', {
				group = group,
				pattern = { 'nvim-treesitter' },
				callback = function()
					vim.notify('Updating treesitter parsers', vim.log.levels.INFO)
					vim.schedule(function()
						local update_promise = require('nvim-treesitter').update(nil, { summary = true })
						if update_promise and update_promise.wait then update_promise:wait(30 * 1000) end
					end)
				end,
			})
		end)
	end,
})

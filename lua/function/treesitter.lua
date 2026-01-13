local au = vim.api.nvim_create_autocmd
-- vim.treesitter
local augroup_treesitter = vim.api.nvim_create_augroup('nvim.treesitter', { clear = true })
local ts_lang = vim.treesitter.language
au('FileType', {
	group = augroup_treesitter,
	callback = function(ev)
		local lang = ts_lang.get_lang(ev.match)
		if lang and ts_lang.add(lang) then
			if pcall(vim.treesitter.start, ev.buf, lang) then
				vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
				vim.wo.foldmethod = 'expr'
				vim.wo.foldlevel = 99
			end
		end
	end,
})
-- nvim-treesitter TSUpdate
au('PackChanged', {
	group = augroup_treesitter,
	pattern = { 'nvim-treesitter' },
	callback = function()
		vim.notify('Updating treesitter parsers', vim.log.levels.INFO)
		vim.schedule(function()
			local nvim_ts = require('nvim-treesitter')
			local update_promise = nvim_ts.update(nil, { summary = true })
			if update_promise and update_promise.wait then update_promise:wait(30 * 1000) end
		end)
	end,
})

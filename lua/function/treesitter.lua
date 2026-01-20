vim.api.nvim_create_autocmd('FileType', {
	group = vim.api.nvim_create_augroup('vim.treesitter', { clear = true }),
	callback = function(ev)
		local ts_lang = vim.treesitter.language
		local lang = ts_lang.get_lang(ev.match)
		if lang and ts_lang.add(lang) then
			if pcall(vim.treesitter.start, ev.buf) then
				vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
				vim.wo.foldmethod = 'expr'
				vim.wo.foldlevel = 99
			end
		end
	end,
})

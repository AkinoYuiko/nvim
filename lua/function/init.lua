local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup('momoGroup', { clear = true })
-- Highlight Yanked Texts
autocmd('TextYankPost', {
	group = group,
	callback = function() vim.hl.on_yank({ timeout = 300 }) end,
})
-- Last place
autocmd('BufReadPost', {
	group = group,
	callback = function()
		local fname = vim.fn.expand('%:t')
		if not fname:match('^COMMIT_EDITMSG$') then
			vim.cmd.setlocal('formatoptions-=ro')
			local pos = vim.fn.getpos('\'"')
			if pos[2] > 0 and pos[2] <= vim.fn.line('$') then vim.api.nvim_win_set_cursor(0, { pos[2], pos[3] - 1 }) end
		end
	end,
})
-- Treesitter
autocmd('FileType', {
	group = group,
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		if lang and pcall(vim.treesitter.start) then
			if vim.treesitter.query.get(lang, 'indents') then
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
			if vim.treesitter.query.get(lang, 'folds') then
				vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
				vim.wo.foldmethod = 'expr'
			end
		end
	end,
})
-- Keymap
vim.schedule(function() require('keymap') end)

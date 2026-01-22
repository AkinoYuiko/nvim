local au = vim.api.nvim_create_autocmd
local uc = vim.api.nvim_create_user_command
local group = vim.api.nvim_create_augroup('momoGroup', { clear = true })
-- Highlight Yanked Texts
au('TextYankPost', {
	group = group,
	callback = function() vim.hl.on_yank({ timeout = 300 }) end,
})
-- Last place
au('BufReadPost', {
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
au('FileType', {
	group = group,
	callback = function(ev)
		local ts_lang = vim.treesitter.language
		local lang = ts_lang.get_lang(ev.match)
		if lang and ts_lang.add(lang) then
			if pcall(vim.treesitter.start, ev.buf) then
				if vim.treesitter.query.get(lang, 'indents') then
					vim.bo[ev.buf].indentexpr = 'v:lua.momo.treesitter.indentexpr()'
				end
				if vim.treesitter.query.get(lang, 'folds') then
					vim.wo.foldexpr = 'v:lua.momo.treesitter.foldexpr()'
					vim.wo.foldmethod = 'expr'
				end
			end
		end
	end,
})
-- Internal fn
au('VimEnter', {
	group = group,
	once = true,
	callback = function()
		vim.defer_fn(function()
			-- chdir
			uc('Chdir', function(args) require('function.chdir').chdir(args.args == 'silent') end, {
				nargs = '?',
				complete = function() return { 'silent' } end,
			})
			-- keymap
			require('keymap')
		end, 0)
	end,
})

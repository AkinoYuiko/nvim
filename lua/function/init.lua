local au = vim.api.nvim_create_autocmd
local uc = vim.api.nvim_create_user_command
local group = vim.api.nvim_create_augroup('momoGroup', {})
-- Highlight Yanked Texts
au('TextYankPost', {
	group = group,
	callback = function() vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 }) end,
})

au('BufRead', {
	callback = function()
		-- Last Place
		vim.cmd.setlocal('formatoptions-=ro')
		local pos = vim.fn.getpos('\'"')
		if pos[2] > 0 and pos[2] <= vim.fn.line('$') then vim.api.nvim_win_set_cursor(0, { pos[2], pos[3] - 1 }) end
	end,
})

local function package_deffered_fn()
	require('plugin')
	-- chdir
	uc('Chdir', function(args) require('internal.chdir').chdir(args.args == 'silent') end, {
		nargs = '?',
		complete = function() return { 'silent' } end,
	})
	-- keymap
	require('keymap')
	-- Treesitter
	require('function.treesitter')
	-- Mason/LSP
	require('function.mason_lsp')
end
au('BufEnter', {
	group = group,
	once = true,
	callback = function()
		-- require('plugin.everforest')
		vim.cmd.colorscheme("everforest-dark-hard")
		vim.defer_fn(package_deffered_fn, 0)
		-- vim.defer_fn(function() end, 0)
	end,
})

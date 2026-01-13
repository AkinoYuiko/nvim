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
	-- Colorscheme
	require('everforest').setup({
		background = 'hard',
		transparent_background_level = 2,
		show_eob = false,
	})
	vim.cmd.colorscheme('everforest')
	-- chdir
	uc('Chdir', function(args) require('function.chdir').chdir(args.args == 'silent') end, {
		nargs = '?',
		complete = function() return { 'silent' } end,
	})
	-- Mini Packs Setup
	local mini_modules = {
		'ai',
		'completion',
		'cmdline',
		'icons',
		'notify',
		'pick',
		'snippets',
		'statusline',
		'tabline',
	}
	for _, mod in ipairs(mini_modules) do
		require('mini.' .. mod).setup()
	end
	require('mini.files').setup({ windows = { preview = true } })
	local ok, mini_keymap = pcall(require, 'mini.keymap')
	if ok then
		local map_multistep = mini_keymap.map_multistep
		if map_multistep ~= nil then
			map_multistep('i', '<Tab>', { 'pmenu_next' })
			map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
			map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
		end
	end
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
		vim.defer_fn(package_deffered_fn, 0)
		-- vim.defer_fn(function() end, 0)
	end,
})

local function mini_setup()
	vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' }, { confirm = false })
	-- Mini Packs Setup
	local mini_modules = {
		['completion'] = {},
		['cmdline'] = {},
		['diff'] = {},
		['extra'] = {},
		['files'] = { windows = { preview = true } },
		-- ['icons'] = {},
		-- ['notify'] = {},
		['pick'] = {},
		['snippets'] = {},
		['statusline'] = {},
		['tabline'] = {},
	}
	for mod, opts in pairs(mini_modules) do
		require('mini.' .. mod).setup(opts)
	end
	-- copied from LazyVim, to handle skip_opts
	momo.mini.pairs({
		-- modes = { insert = true, command = false, terminal = false },
		skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
		skip_ts = { 'string','comment' },
		skip_unbalanced = true,
		markdown = true,
	})
	-- mini.keymap
	local ok, mini_keymap = pcall(require, 'mini.keymap')
	if ok then
		local map_multistep = mini_keymap.map_multistep
		if map_multistep ~= nil then
			map_multistep('i', '<Tab>', { 'pmenu_next' })
			map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
			map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
			map_multistep('i', '<BS>', { 'minipairs_bs' })
		end
	end
	-- mini pick keymap
	require('core.keymap').map({
		-- File/Package keymaps
		{ '<leader>e', function() MiniFiles.open() end, desc = 'open mini.files' },
		{ '<leader>f', function() MiniPick.builtin.files() end, desc = 'open mini.pick' },
		{ '<leader>/', function() MiniPick.builtin.grep_live() end, desc = 'open mini.pick grep' },
		{ '<leader>h', function() MiniPick.builtin.help() end, desc = 'open mini.pick help' },
		{ '<leader>b', function() MiniPick.builtin.buffers() end, desc = 'open mini.pick buffers' },
		{ '<leader>:', function() MiniExtra.pickers.history() end, desc = 'open mini.pick command history' },
		{ '<leader>,', function() MiniExtra.pickers.git_files() end, desc = 'open mini.pick git files' },
	})
end
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
autocmd('UIEnter', {
	group = augroup('mini.nvim', { clear = true }),
	once = true,
	callback = function()
		vim.schedule(mini_setup)
	end,
})
-- Disable mini.completion in snacks
autocmd('FileType', {
	pattern = 'snacks_picker_input',
	group = augroup('user_mini_snacks', { clear = true }),
	callback = function() vim.b.minicompletion_disable = true end,
})

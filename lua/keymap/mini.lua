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

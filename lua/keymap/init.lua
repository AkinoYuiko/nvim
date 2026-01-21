require('keymap.remap')
require('keymap.snacks')
require('core.keymap').map({
	-- { '<F5>', function() require('function.code_running').running(false) end, desc = 'code running (center)' },
	-- { '<F10>', function() require('function.code_running').running(true) end, desc = 'code running (side)' },
	{ 'cs', function() require('function.surround').change_surround() end, desc = 'change surround' },
	{ '<leader>iw', function() require('function.invert_word').invert_word() end, desc = 'invert word' },
	{ 'S', function() require('function.surround').add_surround() end, desc = 'add surround', mode = { 'v' } },
})

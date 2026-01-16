require('keymap.remap')
local map = require('core.keymap')
-- local cmd = map.cmd

map.n({
	-- code_running
	-- ['<F5>'] = function() require('internal.code_running').running(false) end,
	-- ['<F10>'] = function() require('internal.code_running').running(true) end,
	-- surround
	['cs'] = function() require('internal.surround').change_surround() end,
	-- invert_word
	['<leader>iw'] = function() require('internal.invert_word').invert_word() end,
})
map.v({
	-- surround
	['S'] = function() require('internal.surround').add_surround() end,
})

vim.pack.add({
	{ src = 'https://github.com/nvim-mini/mini.completion' },
	{ src = 'https://github.com/nvim-mini/mini.cmdline' },
	{ src = 'https://github.com/nvim-mini/mini.files' },
	-- { src = 'https://github.com/nvim-mini/mini.icons' },
	{ src = 'https://github.com/nvim-mini/mini.keymap' },
	-- { src = 'https://github.com/nvim-mini/mini.notify' },
	{ src = 'https://github.com/nvim-mini/mini.pick' },
	{ src = 'https://github.com/nvim-mini/mini.snippets' },
	{ src = 'https://github.com/nvim-mini/mini.statusline' },
	{ src = 'https://github.com/nvim-mini/mini.tabline' },
}, { confirm = false })
-- Mini Packs Setup
local mini_modules = {
	['completion'] = {},
	['cmdline'] = {},
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
local ok, mini_keymap = pcall(require, 'mini.keymap')
if ok then
	local map_multistep = mini_keymap.map_multistep
	if map_multistep ~= nil then
		map_multistep('i', '<Tab>', { 'pmenu_next' })
		map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
		map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
	end
end

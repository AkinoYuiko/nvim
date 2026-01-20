vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' }, { confirm = false })
-- Mini Packs Setup
local mini_modules = {
	['completion'] = {},
	['cmdline'] = {},
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
require('internal.util.mini').pairs({
	modes = { insert = true, command = true, terminal = false },
	skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
	skip_ts = { 'string' },
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
require('keymap.mini')
-- Disable mini.completion in snacks
vim.api.nvim_create_augroup('user_mini_snacks', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'snacks_picker_input',
	group = 'user_mini_snacks',
	callback = function() vim.b.minicompletion_disable = true end,
})

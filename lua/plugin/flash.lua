if momo.nopack('flash.nvim') then return end
local function flash_setup()
	local ok, mod = pcall(require, 'flash')
	if ok and mod.setup then
		mod.setup()
		require('core.keymap').map({
			{ 's', mod.jump, mode = { 'n', 'x', 'o' }, desc = 'Flash' },
			{ 'S', mod.treesitter, mode = { 'n', 'x', 'o' }, desc = 'Flash Treesitter' },
			{ 'r', mod.remote, mode = 'o', desc = 'Remote Flash' },
			{ 'R', mod.treesitter_search, mode = { 'o', 'x' }, desc = 'Treesitter Search' },
			{ '<c-s>', mod.toggle, mode = { 'c' }, desc = 'Toggle Flash Search' },
		})
	end
end
vim.api.nvim_create_autocmd('UIEnter', {
	group = vim.api.nvim_create_augroup('flash.nvim', { clear = true }),
	once = true,
	callback = function() vim.schedule(flash_setup) end,
})

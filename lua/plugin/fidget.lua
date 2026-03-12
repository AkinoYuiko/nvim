if momo.nopack('fidget.nvim') then return end
local function fidget_setup()
	local ok, mod = pcall(require, 'fidget')
	if ok and mod.setup then mod.setup({ notification = { override_vim_notify = true } }) end
end
vim.api.nvim_create_autocmd('UIEnter', {
	group = vim.api.nvim_create_augroup('plugin.fidget', { clear = trueL }),
	once = true,
	callback = function() vim.schedule(fidget_setup) end,
})

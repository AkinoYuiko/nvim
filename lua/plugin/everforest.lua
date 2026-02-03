local groups = { 'Normal', 'NormalFloat', 'FloatBorder', 'SignColumn', 'LineNr' }
for _, group in ipairs(groups) do
	vim.api.nvim_set_hl(0, group, { bg = 'none' })
end
vim.schedule(function()
	vim.pack.add({ 'https://github.com/sainnhe/everforest' }, { confirm = false })
	-- Colorscheme settings
	vim.g.everforest_background = 'hard'
	vim.g.everforest_float_style = 'blend'
	vim.g.everforest_transparent_background = 2
	vim.cmd.colorscheme('everforest')
end)

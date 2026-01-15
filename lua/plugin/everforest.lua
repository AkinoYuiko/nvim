vim.pack.add({
	{ src = 'https://github.com/sainnhe/everforest' },
}, { confirm = false })
-- Colorscheme settings
vim.g.everforest_background = "hard"
vim.g.everforest_transparent_background = 2
vim.cmd.colorscheme('everforest')

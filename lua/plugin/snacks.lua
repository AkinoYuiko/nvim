vim.pack.add({
	{ src = 'https://github.com/folke/snacks.nvim' },
}, { confirm = false })
require('snacks').setup({
	notify = { enabled = true },
})
require('keymap.snacks')

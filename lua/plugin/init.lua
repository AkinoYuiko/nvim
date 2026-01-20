-- Packages --
vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/mason-org/mason-lspconfig.nvim',
	'https://github.com/j-hui/fidget.nvim',
	-- 'https://github.com/folke/which-key.nvim',
	-- 'https://github.com/nvim-tree/nvim-web-devicons',
}, { confirm = false })
require('plugin.treesitter')
-- mason
require('mason').setup()
require('mason-lspconfig').setup()
-- which-key
-- require('which-key').setup({ preset = 'modern' })
-- noice
-- require('plugin.noice')
-- mini.packs
require('plugin.mini')
-- fidget
require('fidget').setup({ notification = { override_vim_notify = true } })

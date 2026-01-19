-- Packages --
vim.pack.add({
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/neovim/nvim-lspconfig',
	-- 'https://github.com/mikinovation/nvim-gitui',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/mason-org/mason-lspconfig.nvim',
	-- 'https://github.com/j-hui/fidget.nvim',
	-- 'https://github.com/Darazaki/indent-o-matic',
	-- 'https://github.com/folke/which-key.nvim',
}, { confirm = false })
-- mason
require('mason').setup()
require('mason-lspconfig').setup()
-- fidget
-- require('fidget').setup({
-- 	notification = {
-- 		override_vim_notify = true,
-- 	},
-- })
-- indent-o-matic
-- require('indent-o-matic').setup({})
-- mini.packs
require('plugin.mini')

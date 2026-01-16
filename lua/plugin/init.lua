-- Packages --
vim.pack.add({
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	-- { src = 'https://github.com/j-hui/fidget.nvim' },
	-- { src = 'https://github.com/vigoux/notifier.nvim' },
	-- { src = 'https://github.com/Darazaki/indent-o-matic' },
}, { confirm = false })
-- mason
-- require('mason').setup()
-- require('mason-lspconfig').setup()
-- notifier
-- require('notifier').setup({})
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
-- Snacks
-- require('plugin.snacks')

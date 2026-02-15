local autocmd = vim.api.nvim_create_autocmd
local function lsp_setup()
	vim.pack.add({
		'https://github.com/neovim/nvim-lspconfig',
		-- 'https://github.com/mason-org/mason.nvim',
		-- 'https://github.com/mason-org/mason-lspconfig.nvim',
	}, { confirm = false })
	-- setup mason
	-- require('mason').setup()
	-- require('mason-lspconfig').setup()
	-- setup lspconfig
	vim.lsp.enable({
		-- shell
		'bashls',
		'fish_lsp',
		-- nix
		'nil_ls',
		-- lua
		'emmylua_ls',
		'stylua',
		-- js/ts
		'oxlint',
		-- config files
		'jsonls',
		'tombi',
		'yamlls',
	})
	vim.diagnostic.config({ virtual_text = true })
	-- set lsp key bindings
	require('core.keymap').map({
		-- { 'gw', vim.lsp.buf.format, desc = 'LSP Format', mode = { 'n', 'x' } },
		{ 'gq', '<nop>', mode = { 'n', 'x' } },
		-- lsp hover
		{ '<leader>k', vim.lsp.buf.hover, desc = 'lsp hover' },
		-- Fast diagnostic
		{ '<leader>d', vim.diagnostic.open_float, desc = 'open diagnostic flow window' },
		{ ']d', function() vim.diagnostic.jump({ wrap = true, count = 1 }) end },
		{ '[d', function() vim.diagnostic.jump({ wrap = true, count = -1 }) end },
		{ 'gd', vim.lsp.buf.definition, desc = 'Goto Definition' },
		{ 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
		-- { 'gr', vim.lsp.buf.references, nowait = true, desc = 'References' },
		{ 'gI', vim.lsp.buf.implementation, desc = 'Goto Implementation' },
	})
end
autocmd({ 'BufReadPost', 'BufNewFile' }, {
	group = vim.api.nvim_create_augroup('mason-lspconfig', { clear = true }),
	once = true,
	callback = function() vim.schedule(lsp_setup) end,
})
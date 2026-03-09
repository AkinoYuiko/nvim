local function lsp_setup()
	vim.lsp.enable({
		-- shell
		'bashls',
		'fish_lsp',
		-- nix
		'nixd',
		-- lua
		'emmylua_ls',
		-- rust
		'rust_analyzer',
		-- js/ts
		'oxlint',
		'oxfmt',
		-- config files
		'jsonls',
		'tombi',
		'yamlls',
	})
	vim.diagnostic.config({ virtual_text = true })
	-- set lsp key bindings
	require('core.keymap').map({
		{ 'gw', '<nop>', mode = { 'n', 'x' } },
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
vim.api.nvim_create_autocmd('UIEnter', {
	group = vim.api.nvim_create_augroup('lspconfig', { clear = true }),
	once = true,
	callback = function() vim.schedule(lsp_setup) end,
})

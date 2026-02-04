local autocmd = vim.api.nvim_create_autocmd
local function lsp_setup()
	vim.pack.add({
		'https://github.com/neovim/nvim-lspconfig',
		'https://github.com/mason-org/mason.nvim',
		'https://github.com/mason-org/mason-lspconfig.nvim',
	}, { confirm = false })
	-- setup mason
	require('mason').setup()
	require('mason-lspconfig').setup()
	-- setup lspconfig
	vim.lsp.enable({ 'emmylua_ls', 'stylua', 'jsonls', 'tombi', 'yamlls' })
	vim.diagnostic.config({
		virtual_text = true,
		underline = true,
		float = { border = 'single' },
	})
	vim.filetype.add({ extension = { ['lsr'] = 'conf' } }) -- .lsr as .conf
	-- set lsp key bindings
	require('core.keymap').map({
		{ 'gw', vim.lsp.buf.format, desc = 'LSP Format', mode = { 'n', 'x' } },
		{ 'gq', '<nop>', mode = { 'n', 'x' } },
		-- lsp hover
		{ '<leader>k', vim.lsp.buf.hover, desc = 'lsp hover' },
		-- Fast diagnostic
		{ '<leader>d', vim.diagnostic.open_float, desc = 'open diagnostic flow window' },
		{ ']d', function() vim.vim.diagnostic.jump({ wrap = true, count = 1 }) end },
		{ '[d', function() vim.vim.diagnostic.jump({ wrap = true, count = -1 }) end },
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

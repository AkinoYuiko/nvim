require('core.keymap').map({
	-- lsp hover
	{ '<leader>k', vim.lsp.buf.hover, desc = 'lsp hover' },
	-- Fast diagnostic
	{ '<leader>dd', vim.diagnostic.open_float, desc = 'open diagnostic flow window' },
	{ '[d', function() vim.diagnostic.jump({ wrap = true, count = -1 }) end, desc = 'prev diagnostic' },
	{ ']d', function() vim.diagnostic.jump({ wrap = true, count = 1 }) end, desc = 'next diagnostic' },
	-- { 'gw', vim.lsp.buf.format, desc = 'format', mode = { 'n', 'v' } },
	{ 'gw', function() require('conform').format({ lsp_fallback = true }) end },
})

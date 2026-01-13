local map = require('core.keymap')
local cmd = map.cmd

if cmd == nil then return end

map.n({
	-- LSP keymaps
	['gd'] = vim.lsp.buf.definition,
	['gD'] = vim.lsp.buf.declaration,
	['gi'] = vim.lsp.buf.implementation,
	['gr'] = vim.lsp.buf.references,
	['<leader>ca'] = vim.lsp.buf.code_action,
	['<leader>lf'] = vim.lsp.buf.format,
	['<leader>rn'] = vim.lsp.buf.rename,
	-- Fast diagnostic
	['<leader>dd'] = vim.diagnostic.open_float,
	['[d'] = function() vim.diagnostic.jump({ wrap = true, count = -1 }) end,
	[']d'] = function() vim.diagnostic.jump({ wrap = true, count = 1 }) end,
})

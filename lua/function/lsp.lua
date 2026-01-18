-- customized by mason ang mason-lspconfig due to cross-platform usage
-- local lsp_tbl = {
-- 	'bashls',
-- 	'emmylua_ls',
-- 	'fish_lsp',
-- 	'jsonls',
-- 	'rust_analyzer',
-- 	'stylua',
-- 	'tinymist',
-- 	'tombi',
-- 	'ts_ls',
-- 	'yamlls',
-- }
-- vim.lsp.enable(lsp_tbl)
vim.diagnostic.config({ virtual_text = true })
vim.filetype.add({ extension = { ['lsr'] = 'conf' } }) -- .lsr as .conf
-- set lsp key bindings
require('keymap.lsp')
-- autocmd for format on save
local lsp_group = vim.api.nvim_create_augroup('nvim.lsp.format', {})
vim.api.nvim_create_autocmd('LspAttach', {
	group = lsp_group,
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		if
			not client:supports_method('textDocument/willSaveWaitUntil')
			and client:supports_method('textDocument/formatting')
		then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = lsp_group,
				buffer = args.buf,
				callback = function() vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 }) end,
			})
		end
	end,
})

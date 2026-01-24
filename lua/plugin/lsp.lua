local function lsp_setup_fn()
	local lsp_tbl = {
		-- lua
		'emmylua_ls',
		'stylua',
		-- common config filetypes
		'jsonls',
		'tombi',
		'yamlls',
	}
	vim.lsp.enable(lsp_tbl)
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
			if not client then return end
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
end
-- Packages --
vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/mason-org/mason-lspconfig.nvim',
}, {
	confirm = false,
	load = function()
		vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
			group = vim.api.nvim_create_augroup('mason-lspconfig', { clear = true }),
			once = true,
			callback = function()
				vim.schedule(function()
					vim.cmd.packadd('nvim-lspconfig')
					vim.cmd.packadd('mason.nvim')
					vim.cmd.packadd('mason-lspconfig.nvim')
					-- setup mason
					require('mason').setup()
					require('mason-lspconfig').setup()
					-- setup lspconfig
					lsp_setup_fn()
				end)
			end,
		})
	end,
})

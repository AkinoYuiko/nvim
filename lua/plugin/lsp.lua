vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
	group = vim.api.nvim_create_augroup('mason-lspconfig', { clear = true }),
	once = true,
	callback = function()
		vim.schedule(function()
			vim.pack.add({
				'https://github.com/neovim/nvim-lspconfig',
				'https://github.com/mason-org/mason.nvim',
				'https://github.com/mason-org/mason-lspconfig.nvim',
			}, { confirm = false })
			-- setup mason
			require('mason').setup()
			require('mason-lspconfig').setup()
			-- setup lspconfig
			vim.lsp.enable({ 'emmylua_ls', 'jsonls', 'tombi', 'yamlls' })
			vim.diagnostic.config({
				virtual_text = true,
				-- update_in_insert = true,
				-- underline = true,
				float = { border = 'single' },
			})
			vim.filetype.add({ extension = { ['lsr'] = 'conf' } }) -- .lsr as .conf
			-- set lsp key bindings
			require('core.keymap').map({
				-- lsp hover
				{ '<leader>k', vim.lsp.buf.hover, desc = 'lsp hover' },
				-- Fast diagnostic
				{ '<leader>d', vim.diagnostic.open_float, desc = 'open diagnostic flow window' },
				{ ']d', function() vim.vim.diagnostic.jump({ wrap = true, count = 1 }) end },
				{ '[d', function() vim.vim.diagnostic.jump({ wrap = true, count = -1 }) end },
			})
		end)
	end,
})

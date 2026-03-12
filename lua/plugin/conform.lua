vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
	group = vim.api.nvim_create_augroup('lsp.conform', { clear = true }),
	once = true,
	callback = function()
		pcall(vim.cmd.packadd, 'conform.nvim')
		vim.schedule(function()
			local ok, mod = pcall(require, 'conform')
			if ok and mod.setup then
				mod.setup({
					formatters_by_ft = {
						lua = { 'stylua' },
						fish = { 'fish_indent' },
						sh = { 'shfmt' },
						json = { 'jq' },
					},
					formatters = {
						injected = { options = { ignore_errors = true } },
					},
				})
				vim.keymap.set(
					{ 'n', 'x' },
					'<leader><space>',
					function() require('conform').format({ lsp_fallback = true }) end
				)
			end
		end)
	end,
})

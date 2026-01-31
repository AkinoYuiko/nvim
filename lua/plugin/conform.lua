local opts = {
	formatters_by_ft = {
		lua = { 'stylua' },
		fish = { 'fish_indent' },
		sh = { 'shfmt' },
	},
	formatters = {
		injected = { options = { ignore_errors = true } },
	},
}
vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
	group = vim.api.nvim_create_augroup('lsp.conform', { clear = true }),
	once = true,
	callback = function()
		vim.schedule(function()
			vim.pack.add({ 'https://github.com/stevearc/conform.nvim' }, { confirm = false })
			---@diagnostic disable-next-line
			require('conform').setup(opts)
			vim.keymap.set({ 'n', 'x' }, 'gw', function() require('conform').format({ lsp_fallback = true }) end)
		end)
	end,
})

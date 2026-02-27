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
vim.pack.add({ 'https://github.com/stevearc/conform.nvim' }, {
	confirm = false,
	load = function(plug_data)
		vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
			group = vim.api.nvim_create_augroup('lsp.conform', { clear = true }),
			once = true,
			callback = function()
				vim.cmd.packadd(plug_data.spec.name)
				vim.schedule(function()
					---@diagnostic disable-next-line
					require('conform').setup(opts)
					vim.keymap.set({ 'n', 'x' }, 'gw', function() require('conform').format({ lsp_fallback = true }) end)
				end)
			end,
		})
	end,
})

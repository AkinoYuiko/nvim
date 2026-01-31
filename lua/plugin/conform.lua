local opts = {
	formatters_by_ft = {
		lua = { 'stylua' },
	},
}
vim.pack.add({ 'https://github.com/stevearc/conform.nvim' }, {
	confirm = false,
	load = function(pack)
		vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
			group = vim.api.nvim_create_augroup('lsp.conform', { clear = true }),
			once = true,
			callback = function()
				vim.schedule(function()
					vim.cmd.packadd(pack.spec.name)
					---@diagnostic disable-next-line
					require('conform').setup(opts)
				end)
			end,
		})
	end,
})

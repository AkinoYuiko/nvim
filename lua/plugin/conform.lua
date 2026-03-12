if momo.nopack('conform.nvim') then return end
local opts = {
	formatters_by_ft = {
		lua = { 'stylua' },
		fish = { 'fish_indent' },
		sh = { 'shfmt' },
		json = { 'jq' },
	},
	formatters = {
		injected = { options = { ignore_errors = true } },
	},
}
vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
	group = vim.api.nvim_create_augroup('lsp.conform', { clear = true }),
	once = true,
	callback = function()
		vim.schedule(function()
			local ok, mod = pcall(require, 'conform')
			if ok and mod.setup then
				mod.setup(opts)
				vim.keymap.set(
					{ 'n', 'x' },
					'<leader><space>',
					function() require('conform').format({ lsp_fallback = true }) end
				)
			end
		end)
	end,
})

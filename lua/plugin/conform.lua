if momo.nopack('conform.nvim') then return end
local opts = {
	formatters_by_ft = {
		lua = { 'stylua' },
		fish = { 'fish_indent' },
		sh = { 'shfmt' },
		json = { 'jq' },
		rust = { 'rustfmt', lsp_format = 'fallback' },
	},
	default_format_opts = { lsp_format = 'fallback' },
}
vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
	group = vim.api.nvim_create_augroup('lsp.conform', { clear = true }),
	once = true,
	callback = function(ev)
		vim.schedule(function()
			local ok, mod = pcall(require, 'conform')
			if ok and mod.setup then
				mod.setup(opts)
				if require('conform').list_formatters(ev.buf)[1] then
					vim.bo.formatexpr = "v:lua.require'conform'.formatexpr()"
				end
				vim.keymap.set({ 'n', 'x' }, '<leader><space>', require('conform').format)
			end
		end)
	end,
})

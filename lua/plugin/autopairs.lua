vim.api.nvim_create_autocmd('InsertEnter', {
	group = vim.api.nvim_create_augroup('nvim-autopairs', { clear = true }),
	once = true,
	callback = function()
		pcall(vim.cmd.packadd, 'nvim-autopairs')
		vim.schedule(function()
			local ok, mod = pcall(require, 'nvim-autopairs')
			if ok and mod.setup then mod.setup({
				check_ts = true,
				enable_check_bracket_line = true,
			}) end
		end)
	end,
})

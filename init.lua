vim.loader.enable()
vim.g.mapleader = ' '

vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.mouse = 'nv'
vim.opt.number = true
vim.opt.laststatus = 3
vim.opt.scrolloff = 10
vim.opt.winborder = 'single'

vim.opt.list = true
vim.opt.wrap = false
vim.opt.confirm = true
vim.opt.swapfile = false
vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.linebreak = true
vim.opt.listchars = { tab = '» ', nbsp = '+', trail = '·', extends = '→', precedes = '←' }
vim.opt.fillchars = { eob = ' ', fold = ' ' }
vim.opt.grepprg = 'rg --vimgrep --no-messages --smart-case'

require('vim._core.ui2').enable()
vim.opt.cmdheight = 0
vim.g.termfeatures = { osc52 = false }

pcall(vim.cmd.packadd, 'nohlsearch')
pcall(vim.cmd.packadd, 'nvim.undotree')
pcall(vim.cmd.packadd, 'nvim.difftool')
pcall(vim.cmd.packadd, 'nvim-lspconfig')

-- colorscheme
if pcall(vim.cmd.packadd, 'everforest') then
	vim.g.everforest_background = 'hard'
	vim.g.everforest_float_style = 'blend'
	vim.g.everforest_transparent_background = 1
	vim.cmd.colorscheme('everforest')
end

-- keymap
vim.keymap.set('n', '<space>', '<nop>')
vim.keymap.set({ 'n', 'v' }, ';', ':')
vim.keymap.set({ 'n', 'v' }, 'H', '^')
vim.keymap.set({ 'n', 'v' }, 'L', 'g_')
vim.keymap.set('n', 'W', '<cmd>w<cr>')
vim.keymap.set('n', 'Q', '<cmd>q<cr>')
vim.keymap.set('n', 'B', '<cmd>bd<cr>')
vim.keymap.set('n', '<tab>', '<cmd>bNext<cr>')
vim.keymap.set('n', '<s-tab>', '<cmd>bprevious<cr>')
vim.keymap.set('n', '<leader>l', '<cmd>set list! list?<cr>')
vim.keymap.set('n', '<leader>w', '<cmd>set wrap! wrap?<cr>')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'J', '<c-d>')
vim.keymap.set('n', 'K', '<c-u>')
vim.keymap.set('n', '<leader>vim', '<cmd>cd ' .. vim.fn.stdpath('config') .. ' | edit init.lua<cr>')
vim.keymap.set('x', 'J', ":m '>+1<cr>gv=gv", { silent = true })
vim.keymap.set('x', 'K', ":m '<-2<cr>gv=gv", { silent = true })
vim.keymap.set('x', 'N', ':norm ')
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

-- snacks
if pcall(vim.cmd.packadd, 'snacks.nvim') then
	require('snacks').setup({
		bigfile = { enabled = true },
		indent = {
			enabled = true,
			animate = { duration = { step = 15, total = 300 } },
		},
		input = { enabled = true },
		quickfile = { enabled = true },
		scroll = {
			enabled = true,
			animate = { duration = { step = 6, total = 60 } },
			animate_repeat = { delay = 30, duration = { step = 3, total = 30 } },
		},
		statuscolumn = { enabled = true },
		styles = { notification = { wo = { wrap = true } } },
		words = { enabled = true },
	})
end

-- conform
if pcall(vim.cmd.packadd, 'conform.nvim') then
	require('conform').setup({
		formatters_by_ft = {
			lua = { 'stylua' },
			fish = { 'fish_indent' },
			sh = { 'shfmt' },
			json = { 'jq' },
			rust = { 'rustfmt', lsp_format = 'fallback' },
		},
		default_format_opts = { lsp_format = 'fallback' },
	})
	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	vim.keymap.set('n', '<leader><leader>', require('conform').format)
	vim.keymap.set({ 'n', 'v' }, 'gw', '<nop>', { noremap = true })
end

-- autocmd & lazyload
vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.hl.on_yank() end })
vim.api.nvim_create_autocmd('FileType', {
	group = group,
	callback = function(ev)
		if pcall(vim.treesitter.start) then
			local lang = vim.treesitter.language.get_lang(ev.match)
			if not lang then return end
			-- if vim.treesitter.query.get(lang, 'indents') then
			-- 	vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			-- end
			if vim.treesitter.query.get(lang, 'folds') then
				vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
				vim.o.foldmethod = 'expr'
				vim.o.foldlevel = 99
			end
		end
		vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
	end,
})
vim.api.nvim_create_autocmd('UIEnter', {
	once = true,
	callback = function()
		if pcall(vim.cmd.packadd, 'flash.nvim') then
			require('flash').setup()
			vim.keymap.set({ 'n', 'o', 'x' }, 's', require('flash').jump)
			vim.keymap.set({ 'n', 'o', 'x' }, 'S', require('flash').treesitter)
			vim.keymap.set({ 'o' }, 'r', require('flash').remote)
			vim.keymap.set({ 'o', 'x' }, 'R', require('flash').treesitter_search)
		end
		if pcall(vim.cmd.packadd, 'mini.nvim') then
			require('mini.completion').setup({
				lsp_completion = {
					source_func = 'omnifunc',
					auto_setup = false,
					process_items = function(items, base)
						local ok, ret =
							pcall(MiniCompletion.default_process_items, items, base, { kind_priority = { Text = -1, Snippet = 99 } })
						if ok then return ret end
					end,
				},
			})
			require('mini.cmdline').setup()
			require('mini.diff').setup({ view = { priority = 1 } })
			require('mini.extra').setup()
			require('mini.files').setup({ windows = { preview = true } })
			-- require('mini.indentscope').setup({ symbol = '|' })
			require('mini.pick').setup()
			require('mini.snippets').setup()
			require('mini.statusline').setup()
			require('mini.tabline').setup()
			local ok, mini_keymap = pcall(require, 'mini.keymap')
			if ok then
				local map_multistep = mini_keymap.map_multistep
				if map_multistep ~= nil then
					map_multistep('i', '<tab>', { 'pmenu_next' })
					map_multistep('i', '<s-tab>', { 'pmenu_prev' })
					map_multistep('i', '<cr>', { 'pmenu_accept' })
				end
			end
			vim.keymap.set('n', '<leader>e', function() pcall(MiniFiles.open) end)
			vim.keymap.set('n', '<leader>f', function() pcall(MiniPick.builtin.files) end)
			vim.keymap.set('n', '<leader>/', function() pcall(MiniPick.builtin.grep_live) end)
			vim.keymap.set('n', '<leader>h', function() pcall(MiniPick.builtin.help) end)
			vim.keymap.set('n', '<leader>b', function() pcall(MiniPick.builtin.buffers) end)
			vim.keymap.set('n', '<leader>:', function() pcall(MiniExtra.pickers.history) end)
			vim.keymap.set('n', '<leader>,', function() pcall(MiniExtra.pickers.git_files) end)
		end
	end,
})
vim.api.nvim_create_autocmd('InsertEnter', {
	once = true,
	callback = function()
		if not pcall(vim.cmd.packadd, 'nvim-autopairs') then return end
		local ok, mod = pcall(require, 'nvim-autopairs')
		if ok and mod.setup then mod.setup({
			check_ts = true,
			enable_check_bracket_line = true,
		}) end
	end,
})
vim.api.nvim_create_autocmd('LspAttach', {
	once = true,
	callback = function()
		if MiniCompletion then vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() }) end
		vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)
		vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
		vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ wrap = true, count = 1 }) end)
		vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ wrap = true, count = -1 }) end)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
		vim.keymap.set('n', 'gI', vim.lsp.buf.implementation)
	end,
})

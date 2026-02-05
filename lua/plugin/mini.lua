local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local function mini_setup()
	vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' }, { confirm = false })
	-- Mini Packs Setup
	local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }
	local process_items = function(items, base)
		return MiniCompletion.default_process_items(items, base, process_items_opts)
	end
	local mini_modules = {
		['completion'] = {
			lsp_completion = {
				source_func = 'omnifunc',
				auto_setup = false,
				process_items = process_items,
			},
		},
		['cmdline'] = {},
		['diff'] = { view = { priority = 1 } },
		['extra'] = {},
		['files'] = { windows = { preview = true } },
		['indentscope'] = { symbol = '|' },
		-- ['icons'] = {},
		-- ['notify'] = {},
		['pick'] = {},
		['snippets'] = {},
		['statusline'] = {},
		['tabline'] = {},
	}
	for mod, opts in pairs(mini_modules) do
		require('mini.' .. mod).setup(opts)
	end
	-- Mini completion with LSP Compatibilities
	autocmd('LspAttach', {
		group = augroup('LspAttach', { clear = true }),
		callback = function(ev) vim.bo[ev.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp' end,
	})
	vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
	-- mini.keymap
	local ok, mini_keymap = pcall(require, 'mini.keymap')
	if ok then
		local map_multistep = mini_keymap.map_multistep
		if map_multistep ~= nil then
			map_multistep('i', '<tab>', { 'pmenu_next' })
			map_multistep('i', '<s-tab>', { 'pmenu_prev' })
			map_multistep('i', '<cr>', { 'pmenu_accept' })
		end
	end
	-- mini pick keymap
	require('core.keymap').map({
		-- File/Package keymaps
		{ '<leader>e', function() MiniFiles.open() end, desc = 'open mini.files' },
		{ '<leader>f', function() MiniPick.builtin.files() end, desc = 'open mini.pick' },
		{ '<leader>/', function() MiniPick.builtin.grep_live() end, desc = 'open mini.pick grep' },
		{ '<leader>h', function() MiniPick.builtin.help() end, desc = 'open mini.pick help' },
		{ '<leader>b', function() MiniPick.builtin.buffers() end, desc = 'open mini.pick buffers' },
		{ '<leader>:', function() MiniExtra.pickers.history() end, desc = 'open mini.pick command history' },
		{ '<leader>,', function() MiniExtra.pickers.git_files() end, desc = 'open mini.pick git files' },
	})
end
autocmd('UIEnter', {
	group = augroup('mini.nvim', { clear = true }),
	once = true,
	callback = function() vim.schedule(mini_setup) end,
})
-- Disable mini.completion in snacks
autocmd('FileType', {
	pattern = 'snacks_picker_input',
	group = augroup('user_mini_snacks', { clear = true }),
	callback = function() vim.b.minicompletion_disable = true end,
})

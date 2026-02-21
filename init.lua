vim.loader.enable()
vim.g.mapleader = ' '
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
-- ext ui
require('vim._core.ui2').enable({})
-- options
local opt = vim.opt
opt.number = true
opt.cursorline = true
opt.cursorlineopt = 'number'
opt.signcolumn = 'yes'
opt.swapfile = false
opt.expandtab = true
opt.shiftwidth = 0
opt.tabstop = 2
opt.mouse = 'nv'
opt.winborder = 'rounded'
opt.cmdheight = 0
-- opt.pumheight = 10
-- opt.pumwidth = 10
opt.scrolloff = 8
-- opt.sidescrolloff = 8
opt.foldlevel = 99
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.fillchars = {
	stl = ' ',
	stlnc = '-',
	msgsep = ' ',
	foldopen = '',
	foldclose = '',
	fold = ' ',
	foldsep = ' ',
	diff = '╱',
	eob = ' ',
}
opt.list = true
opt.listchars = { tab = '» ', nbsp = '+', trail = '·', extends = '→', precedes = '←' }
opt.linebreak = true
opt.wrap = false
-- opt.inccommand = 'split'
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.termguicolors = true
-- netrw
vim.g.netrw_banner = 0
-- trans bg
vim.cmd.colorscheme('everforest')
-- function
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local keymap = vim.keymap.set
local group = augroup('momoGroup', { clear = true })
-- Treesitter
autocmd('FileType', {
	group = group,
	callback = function()
		pcall(vim.treesitter.start)
		opt.formatoptions:remove({ 'c', 'r', 'o' })
	end,
})

-- Highlight Yanked Texts
autocmd('TextYankPost', { group = group, callback = function() vim.hl.on_yank({ timeout = 300 }) end })
-- Custom Event: LazyFile
autocmd({ 'BufReadPost', 'BufNewFile' }, {
	desc = 'User Event LazyFile',
	group = group,
	once = true,
	callback = function()
		if not vim.g._lazyfile_triggered then
			vim.g._lazyfile_triggered = true
			vim.schedule(function() vim.api.nvim_exec_autocmds('User', { pattern = 'LazyFile' }) end)
		end
	end,
})
-- Statusline
autocmd('UIEnter', {
	group = group,
	once = true,
	callback = function()
		vim.schedule(function() require('mini.statusline').setup() end)
	end,
})
-- LSP
autocmd('User', {
	group = group,
	pattern = 'LazyFile',
	callback = function()
		vim.lsp.enable({ 'bashls', 'emmylua_ls', 'stylua', 'fish_lsp', 'jsonls', 'rust_analyzer', 'tombi', 'yamlls' })
		vim.diagnostic.config({ virtual_text = true })
		vim.filetype.add({ extension = { ['lsr'] = 'conf' } }) -- .lsr as .conf
		keymap('n', 'gd', vim.lsp.buf.definition, { desc = 'goto lsp definition' })
		keymap('n', 'gD', vim.lsp.buf.declaration, { desc = 'goto lsp declaration' })
		keymap('n', 'gI', vim.lsp.buf.implementation, { desc = 'goto lsp implementation' })
		keymap('n', '<leader>k', vim.lsp.buf.hover, { desc = 'lsp hover' })
		keymap('n', '<leader>d', vim.diagnostic.open_float, { desc = 'diagnostic messages' })
		keymap('n', '[d', function() vim.diagnostic.jump({ wrap = true, count = -1 }) end, { desc = 'prev diagnostic' })
		keymap('n', ']d', function() vim.diagnostic.jump({ wrap = true, count = 1 }) end, { desc = 'next diagnostic' })
		keymap({ 'n', 'x' }, 'gw', vim.lsp.buf.format, { desc = 'format' })
		keymap({ 'n', 'x' }, 'gq', '<nop>', { noremap = true })
	end,
})
-- Last place
autocmd('BufReadPost', {
	group = group,
	callback = function()
		local fname = vim.fn.expand('%:t')
		if not fname:match('^COMMIT_EDITMSG$') then
			vim.cmd.setlocal('formatoptions-=ro')
			local pos = vim.fn.getpos('\'"')
			if pos[2] > 0 and pos[2] <= vim.fn.line('$') then vim.api.nvim_win_set_cursor(0, { pos[2], pos[3] - 1 }) end
		end
	end,
})
-- map
keymap('n', '<space>', '<Nop>', { noremap = true })
-- fast command
keymap({ 'n', 'o', 'x' }, ';', ':', { noremap = true })
-- fast move to line begin/end
keymap({ 'n', 'x' }, 'H', '^', { noremap = true })
keymap({ 'n', 'x' }, 'L', 'g_', { noremap = true })
-- fast save/quit and close buffer
keymap('n', 'W', '<cmd>w<cr>', { noremap = true })
keymap('n', 'Q', '<cmd>q<cr>', { noremap = true })
keymap('n', 'B', '<cmd>bd<cr>', { noremap = true })
-- map('n','ca', '<cmd>silent %y+<cr>')
-- file explorer and tab to switch buffers
keymap('n', '<leader>e', '<cmd>Lexplore<cr>', { noremap = true })
keymap('n', '<leader>b', '<cmd>buffers<cr>', { noremap = true })
keymap('n', '<tab>', '<cmd>bNext<cr>', { noremap = true })
keymap('n', '<S-tab>', '<cmd>bprevious<cr>', { noremap = true })
-- map('n', '<leader>c', '<cmd>set spell! spell?<cr>' )
keymap('n', '<leader>l', '<cmd>set list! list?<cr>', { noremap = true })
keymap('n', '<leader>m', '<cmd>set number! number?<cr>', { noremap = true })
keymap('n', '<leader>w', '<cmd>set wrap! wrap?<cr>', { noremap = true })
keymap('n', '<leader><cr>', '<cmd>noh<cr>', { noremap = true })
-- map('n','<leader><leader>', '/<++><CR>:noh<CR>"_c4l',, {noremap=true})
keymap('n', 'j', 'gj', { noremap = true })
keymap('n', 'k', 'gk', { noremap = true })
keymap('n', 'J', '<c-d>', { noremap = true })
keymap('n', 'K', '<c-u>', { noremap = true })
-- window
keymap('n', '<c-h>', '<c-w>h', { noremap = true })
keymap('n', '<c-j>', '<c-w>j', { noremap = true })
keymap('n', '<c-k>', '<c-w>k', { noremap = true })
keymap('n', '<c-l>', '<c-w>l', { noremap = true })
-- Keep current search result centered on the screen
-- map('n', 'n', 'nzz' , {noremap=true})
-- map('n', 'N', 'Nzz' , {noremap=true})
-- stay in visual after <,>
keymap('v', '<', '<gv', { noremap = true })
keymap('v', '>', '>gv', { noremap = true })
-- map('n', '<leader>W', '<c-w>w' , {noremap=true})
keymap('n', '<leader>sh', '<cmd>set nosplitright | vsplit<cr>', { noremap = true })
keymap('n', '<leader>sj', '<cmd>set splitbelow | split<cr>', { noremap = true })
keymap('n', '<leader>sk', '<cmd>set nosplitbelow | split<cr>', { noremap = true })
keymap('n', '<leader>sl', '<cmd>set splitright | vsplit<cr>', { noremap = true })
keymap('n', '<leader>smv', '<c-w>t<c-W>H', { noremap = true })
keymap('n', '<leader>smh', '<c-w>t<c-W>K', { noremap = true })
-- open vim config
keymap('n', '<leader>vim', '<cmd>cd ' .. vim.fn.stdpath('config') .. '| edit init.lua<cr>', { noremap = true })
-- update all packs
-- map('n', '<leader>up', function() vim.pack.update(nil, { force = true }) end , {noremap=true})
-- Line Move
keymap('v', 'J', ":m '>+1<cr>gv=gv", { silent = true, noremap = true })
keymap('v', 'K', ":m '<-2<cr>gv=gv", { silent = true, noremap = true })
-- fast Norm in visual
keymap('v', 'N', ':norm ', { noremap = true })
-- systemd-wide yank, cut and paste
keymap('v', '<leader>c', '"+y', { noremap = true })
keymap('v', '<leader>x', '"+d', { noremap = true })
keymap('v', '<leader>p', '"+p', { noremap = true })
-- fast switch mode in terminal
keymap('t', '<c-n>', '<C-\\><C-N>', { noremap = true })
keymap('t', '<c-o>', '<C-\\><C-N><C-O>', { noremap = true })
-- Ctrl + h,j,k,l to mode cursor in insert/command mode
keymap({ 'i', 'c' }, '<c-h>', '<Left>', { noremap = true })
keymap({ 'i', 'c' }, '<c-l>', '<Right>', { noremap = true })
keymap({ 'i', 'c' }, '<c-a>', '<Home>', { noremap = true })
keymap({ 'i', 'c' }, '<c-e>', '<End>', { noremap = true })

vim.loader.enable()
vim.g.mapleader = ' '
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
-- ext ui
require('vim._extui').enable({})
-- options
local opt = vim.opt
opt.number = true
opt.signcolumn = 'yes'
opt.cursorline = true
opt.swapfile = false
opt.expandtab = true
opt.shiftwidth = 0
opt.tabstop = 2
opt.mouse = 'nv'
opt.winborder = 'rounded'
opt.cmdheight = 0
opt.pumheight = 10
opt.pumwidth = 10
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.foldlevel = 99
opt.foldmethod = 'expr'
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
local groups = { 'Normal', 'NormalFloat', 'FloatBorder', 'SignColumn', 'LineNr' }
for _, group in ipairs(groups) do
	vim.api.nvim_set_hl(0, group, { bg = 'none' })
end
vim.cmd.colorscheme('everforest')
-- function
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local group = augroup('momoGroup', { clear = true })
local map = vim.keymap.set
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
		vim.lsp.enable({
			'bashls',
			'emmylua_ls',
			'stylua',
			'fish_lsp',
			'jsonls',
			'rust_analyzer',
			'tombi',
			'yamlls',
		})
		vim.diagnostic.config({ virtual_text = true })
		vim.filetype.add({ extension = { ['lsr'] = 'conf' } }) -- .lsr as .conf
		map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'diagnostic messages' })
		map('n', '[d', function() vim.diagnostic.jump({ wrap = true, count = -1 }) end, { desc = 'prev diagnostic' })
		map('n', ']d', function() vim.diagnostic.jump({ wrap = true, count = 1 }) end, { desc = 'next diagnostic' })
		-- lsp hover
		map('n', '<leader>k', vim.lsp.buf.hover, { desc = 'lsp hover' })
		-- Fast diagnostic
		map({ 'n', 'x' }, 'gw', vim.lsp.buf.format, { desc = 'format' })
		map({ 'n', 'x' }, 'gq', '<nop>', { noremap = true })
	end,
})
-- Highlight Yanked Texts
autocmd('TextYankPost', {
	group = group,
	callback = function() vim.hl.on_yank({ timeout = 300 }) end,
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
-- Treesitter
-- autocmd('FileType', {
-- 	group = group,
-- 	callback = function(ev)
-- 		local lang = vim.treesitter.language.get_lang(ev.match)
-- 		if lang and vim.treesitter.language.add(lang) then
-- 			if pcall(vim.treesitter.start) then
-- 				-- if vim.treesitter.query.get(lang, 'indents') then
-- 				-- 	vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- 				-- end
-- 				if vim.treesitter.query.get(lang, 'folds') then
-- 					vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- 					vim.wo.foldmethod = 'expr'
-- 				end
-- 			end
-- 		end
-- 	end,
-- })
-- map
map('n', '<space>', '<Nop>', { noremap = true })
-- fast command
map({ 'n', 'o', 'x' }, ';', ':', { noremap = true })
-- fast move to line begin/end
map({ 'n', 'o', 'x' }, 'H', '^', { noremap = true })
map({ 'n', 'o', 'x' }, 'L', 'g_', { noremap = true })
-- fast save/quit and close buffer
map('n', 'W', '<cmd>w<cr>', { noremap = true })
map('n', 'Q', '<cmd>q<cr>', { noremap = true })
map('n', 'B', '<cmd>bd<cr>', { noremap = true })
-- map('n','ca', '<cmd>silent %y+<cr>')
-- file explorer and tab to switch buffers
map('n', '<leader>e', '<cmd>Lexplore<cr>', { noremap = true })
map('n', '<leader>b', '<cmd>buffers<cr>', { noremap = true })
map('n', '<tab>', '<cmd>bNext<cr>', { noremap = true })
map('n', '<S-tab>', '<cmd>bprevious<cr>', { noremap = true })
-- map('n', '<leader>c', '<cmd>set spell! spell?<cr>' )
map('n', '<leader>l', '<cmd>set list! list?<cr>', { noremap = true })
map('n', '<leader>m', '<cmd>set number! number?<cr>', { noremap = true })
map('n', '<leader>w', '<cmd>set wrap! wrap?<cr>', { noremap = true })
map('n', '<leader><cr>', '<cmd>noh<cr>', { noremap = true })
-- map('n','<leader><leader>', '/<++><CR>:noh<CR>"_c4l',, {noremap=true})
map('n', 'j', 'gj', { noremap = true })
map('n', 'k', 'gk', { noremap = true })
map('n', 'J', '<c-d>', { noremap = true })
map('n', 'K', '<c-u>', { noremap = true })
-- window
map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })
-- Keep current search result centered on the screen
-- map('n', 'n', 'nzz' , {noremap=true})
-- map('n', 'N', 'Nzz' , {noremap=true})
-- stay in visual after <,>
map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })
-- map('n', '<leader>W', '<c-w>w' , {noremap=true})
map('n', '<leader>sh', '<cmd>set nosplitright | vsplit<cr>', { noremap = true })
map('n', '<leader>sj', '<cmd>set splitbelow | split<cr>', { noremap = true })
map('n', '<leader>sk', '<cmd>set nosplitbelow | split<cr>', { noremap = true })
map('n', '<leader>sl', '<cmd>set splitright | vsplit<cr>', { noremap = true })
map('n', '<leader>smv', '<c-w>t<c-W>H', { noremap = true })
map('n', '<leader>smh', '<c-w>t<c-W>K', { noremap = true })
-- open vim config
map('n', '<leader>vim', '<cmd>cd ' .. vim.fn.stdpath('config') .. '| edit init.lua<cr>', { noremap = true })
-- update all packs
-- map('n', '<leader>up', function() vim.pack.update(nil, { force = true }) end , {noremap=true})
-- Line Move
map('v', 'J', ":m '>+1<cr>gv=gv", { silent = true, noremap = true })
map('v', 'K', ":m '<-2<cr>gv=gv", { silent = true, noremap = true })
-- fast Norm in visual
map('v', 'N', ':norm ', { noremap = true })
-- systemd-wide yank, cut and paste
map('v', '<leader>c', '"+y', { noremap = true })
map('v', '<leader>x', '"+d', { noremap = true })
map('v', '<leader>p', '"+p', { noremap = true })
-- fast switch mode in terminal
map('t', '<c-n>', '<C-\\><C-N>', { noremap = true })
map('t', '<c-o>', '<C-\\><C-N><C-O>', { noremap = true })
-- Ctrl + h,j,k,l to mode cursor in insert/command mode
map({ 'i', 'c' }, '<c-h>', '<Left>', { noremap = true })
map({ 'i', 'c' }, '<c-l>', '<Right>', { noremap = true })
map({ 'i', 'c' }, '<c-a>', '<Home>', { noremap = true })
map({ 'i', 'c' }, '<c-e>', '<End>', { noremap = true })

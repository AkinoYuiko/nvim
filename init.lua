vim.loader.enable()
vim.g.mapleader = ' '
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
opt.shiftround = true
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
opt.listchars = 'tab:» ,nbsp:+,trail:·,extends:→,precedes:←'
opt.linebreak = true
opt.wrap = false
-- opt.inccommand = 'split'
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.termguicolors = true
-- trans bg
local groups = { 'Normal', 'NormalFloat', 'FloatBorder', 'SignColumn', 'LineNr' }
for _, group in ipairs(groups) do
	vim.api.nvim_set_hl(0, group, { bg = 'none' })
end
vim.cmd.colorscheme('everforest')
-- function
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local keymap = vim.keymap.set
local group = augroup('momoGroup', { clear = true })
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
autocmd('VimEnter', {
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
		vim.lsp.enable({ 'bashls', 'emmylua_ls', 'fish_lsp', 'jsonls', 'rust_analyzer', 'stylua', 'tombi', 'yamlls' })
		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = true,
			underline = true,
			-- float = { border = 'rounded' },
		})
		vim.filetype.add({ extension = { ['lsr'] = 'conf' } }) -- .lsr as .conf
		keymap('n', '<leader>d', vim.diagnostic.open_float, { desc = 'diagnostic messages' })
		keymap('n', '[d', function() vim.diagnostic.jump({ wrap = true, count = -1 }) end, { desc = 'prev diagnostic' })
		keymap('n', ']d', function() vim.diagnostic.jump({ wrap = true, count = 1 }) end, { desc = 'next diagnostic' })
		-- lsp hover
		keymap('n', '<leader>k', vim.lsp.buf.hover, { desc = 'lsp hover' })
		-- Fast diagnostic
		keymap({ 'n', 'x' }, 'gw', vim.lsp.buf.format, { desc = 'format' })
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
-- keymap
keymap('n', '<space>', '<Nop>', { noremap = true })
-- fast command
keymap({ 'n', 'o', 'x' }, ';', ':', { noremap = true })
-- fast move to line begin/end
keymap({ 'n', 'o', 'x' }, 'H', '^', { noremap = true })
keymap({ 'n', 'o', 'x' }, 'L', 'g_', { noremap = true })
-- fast save/quit and close buffer
keymap('n', 'W', '<cmd>w<cr>', { noremap = true })
keymap('n', 'Q', '<cmd>q<cr>', { noremap = true })
keymap('n', 'B', '<cmd>bd<cr>', { noremap = true })
-- keymap('n','ca', '<cmd>silent %y+<cr>')
-- keymap('n', '<leader>c', '<cmd>set spell! spell?<cr>' )
keymap('n', '<leader>l', '<cmd>set list! list?<cr>', { noremap = true })
keymap('n', '<leader>m', '<cmd>set number! number?<cr>', { noremap = true })
keymap('n', '<leader>w', '<cmd>set wrap! wrap?<cr>', { noremap = true })
keymap('n', '<leader><cr>', '<cmd>noh<cr>', { noremap = true })
-- keymap('n','<leader><leader>', '/<++><CR>:noh<CR>"_c4l',, {noremap=true})
keymap('n', 'j', 'gj', { noremap = true })
keymap('n', 'k', 'gk', { noremap = true })
keymap('n', 'J', '<c-d>', { noremap = true })
keymap('n', 'K', '<c-u>', { noremap = true })
-- window
keymap('n', '<C-h>', '<C-w>h', { noremap = true })
keymap('n', '<C-j>', '<C-w>j', { noremap = true })
keymap('n', '<C-k>', '<C-w>k', { noremap = true })
keymap('n', '<C-l>', '<C-w>l', { noremap = true })
-- Keep current search result centered on the screen
-- keymap('n', 'n', 'nzz' , {noremap=true})
-- keymap('n', 'N', 'Nzz' , {noremap=true})
-- stay in visual after <,>
-- keymap('v', '<', '<gv', {noremap=true})
-- keymap('v', '>', '>gv', {noremap=true})
-- keymap('n', '<leader>W', '<c-w>w' , {noremap=true})
keymap('n', '<leader>sh', '<cmd>set nosplitright | vsplit<cr>', { noremap = true })
keymap('n', '<leader>sj', '<cmd>set splitbelow | split<cr>', { noremap = true })
keymap('n', '<leader>sk', '<cmd>set nosplitbelow | split<cr>', { noremap = true })
keymap('n', '<leader>sl', '<cmd>set splitright | vsplit<cr>', { noremap = true })
keymap('n', '<leader>smv', '<c-w>t<c-W>H', { noremap = true })
keymap('n', '<leader>smh', '<c-w>t<c-W>K', { noremap = true })
-- open vim config
-- keymap('n', '<leader>vim', '<cmd>edit ' .. vim.fn.stdpath('config') .. '/init.lua | Chdir silent<cr>' , {noremap=true})
-- update all packs
-- keymap('n', '<leader>up', function() vim.pack.update(nil, { force = true }) end , {noremap=true})
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

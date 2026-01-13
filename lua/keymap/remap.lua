local map = require('core.keymap')
local cmd = map.cmd

if cmd == nil then return end

map.n({
	['W'] = cmd('w'),
	['Q'] = cmd('q'),
	['B'] = cmd('bd'),
	-- ['ca'] = cmd('silent %y+'),
	['<leader>sc'] = cmd('set spell!'),
	-- ['<leader>sl'] = cmd('set list!'),
	['<leader>sm'] = cmd('set number!'),
	['<leader>sw'] = cmd('set wrap!'),
	['<leader><cr>'] = cmd('noh'),
	-- ['<leader><leader>'] = '/<++><CR>:noh<CR>"_c4l',
	['j'] = 'gj',
	['k'] = 'gk',
	['J'] = '<c-d>',
	['K'] = '<c-u>',
	-- window
	['<C-h>'] = '<C-w>h',
	['<C-j>'] = '<C-w>j',
	['<C-k>'] = '<C-w>k',
	['<C-l>'] = '<C-w>l',
	['<leader>W'] = '<c-w>w',
	['<leader>sh'] = cmd('set nosplitright | vsplit'),
	['<leader>sj'] = cmd('set splitbelow | split'),
	['<leader>sk'] = cmd('set nosplitbelow | split'),
	['<leader>sl'] = cmd('set splitright | vsplit'),
	['<leader>smv'] = '<c-w>t<c-W>H',
	['<leader>smh'] = '<c-w>t<c-W>K',
	-- open vim config
	['<leader>vim'] = cmd('edit ' .. vim.fn.stdpath('config') .. '/init.lua | Chdir silent'),
	-- Line Move
	['<A-j>'] = ':m .+1<CR>==',
	['<A-k>'] = ':m .-2<CR>==',
	-- File/Package keymaps
	['<leader>e'] = ':lua MiniFiles.open()<CR>',
	['<leader>f'] = ':Pick files<CR>',
	['<leader>g'] = ':Pick grep_live<CR>',
	['<leader>h'] = ':Pick help<CR>',
	['<leader>b'] = ':Pick buffers<CR>',
})
map.nox({
	[';'] = ':',
	['H'] = '^',
	['L'] = 'g_',
})

map.nx({
	['<A-j>'] = ":m '>+1<CR>gv=gv",
	['<A-k>'] = ":m '<-2<CR>gv=gv",
})

map.v({
	['N'] = ':normal',
	-- ['Y'] = '"+y',
	['<leader>c'] = '"+y',
	['<leader>x'] = '"+d',
	['<leader>p'] = '"+p',
})

-- map.t({
--   ['<c-n>'] = '<C-\\><C-N>',
--   ['<c-o>'] = '<C-\\><C-N><C-O>',
-- })

map.ic({
	['<c-h>'] = '<Left>',
	['<c-l>'] = '<Right>',
	['<c-a>'] = '<Home>',
	['<c-e>'] = '<End>',
})

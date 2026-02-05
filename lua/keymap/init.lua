local map = require('core.keymap').map
local cmd = require('core.keymap').cmd
map({
	{ '<space>', '<Nop>' },
	-- fast command
	{ ';', ':', mode = { 'n', 'o', 'x' } },
	-- fast move to line begin/end
	{ 'H', '^', mode = { 'n', 'o', 'x' } },
	{ 'L', 'g_', mode = { 'n', 'o', 'x' } },
	-- fast save/quit and close buffer
	{ 'W', cmd('w') },
	{ 'Q', cmd('q') },
	{ 'B', cmd('bd') },
	{ '<tab>', cmd('bNext') },
	{ '<s-tab>', cmd('bprevious') },
	-- {'ca', cmd('silent %y+'),},
	-- { '<leader>c', cmd('set spell! spell?') },
	{ '<leader>l', cmd('set list! list?') },
	{ '<leader>m', cmd('set number! number?') },
	{ '<leader>w', cmd('set wrap! wrap?') },
	{ '<leader><cr>', cmd('noh') },
	-- {'<leader><leader>', '/<++><CR>:noh<CR>"_c4l',},
	{ 'j', 'gj' },
	{ 'k', 'gk' },
	{ 'J', '<c-d>' },
	{ 'K', '<c-u>' },
	-- window
	{ '<C-h>', '<C-w>h' },
	{ '<C-j>', '<C-w>j' },
	{ '<C-k>', '<C-w>k' },
	{ '<C-l>', '<C-w>l' },
	-- Keep current search result centered on the screen
	-- { 'n', 'nzz' },
	-- { 'N', 'Nzz' },
	-- stay in visual after <,>
	{ '<', '<gv', mode = 'v' },
	{ '>', '>gv', mode = 'v' },
	-- { '<leader>W', '<c-w>w' },
	{ '<leader>sh', cmd('set nosplitright | vsplit') },
	{ '<leader>sj', cmd('set splitbelow | split') },
	{ '<leader>sk', cmd('set nosplitbelow | split') },
	{ '<leader>sl', cmd('set splitright | vsplit') },
	{ '<leader>smv', '<c-w>t<c-W>H' },
	{ '<leader>smh', '<c-w>t<c-W>K' },
	-- open vim config
	{ '<leader>vim', cmd('edit ' .. vim.fn.stdpath('config') .. '/init.lua | Chdir silent') },
	-- update all packs
	{ '<leader>up', function() vim.pack.update(nil, { force = true }) end },
	-- Line Move
	{ 'J', ":m '>+1<cr>gv=gv", mode = 'v', silent = true },
	{ 'K', ":m '<-2<cr>gv=gv", mode = 'v', silent = true },
	-- fast Norm in visual
	{ 'N', ':norm ', mode = { 'v' } },
	-- systemd-wide yank, cut and paste
	{ '<leader>c', '"+y', mode = { 'v' } },
	{ '<leader>x', '"+d', mode = { 'v' } },
	{ '<leader>p', '"+p', mode = { 'v' } },
	-- fast switch mode in terminal
	{ '<c-n>', '<C-\\><C-N>', mode = { 't' } },
	{ '<c-o>', '<C-\\><C-N><C-O>', mode = { 't' } },
	-- Ctrl + h,j,k,l to mode cursor in insert/command mode
	{ '<c-h>', '<Left>', mode = { 'i', 'c' } },
	{ '<c-l>', '<Right>', mode = { 'i', 'c' } },
	{ '<c-a>', '<Home>', mode = { 'i', 'c' } },
	{ '<c-e>', '<End>', mode = { 'i', 'c' } },
	-- { '<F5>', function() require('function.code_running').running(false) end, desc = 'code running (center)' },
	-- { '<F10>', function() require('function.code_running').running(true) end, desc = 'code running (side)' },
	{ '<leader>iw', function() require('function.invert_word').invert_word() end, desc = 'invert word' },
	{ 'cs', function() require('function.surround').change_surround() end, desc = 'change surround' },
	{ 'S', function() require('function.surround').add_surround() end, desc = 'add surround', mode = { 'v' } },
})

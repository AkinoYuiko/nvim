local opt = vim.opt
opt.number = true
opt.cursorline = true
opt.cursorlineopt = 'number'
opt.swapfile = false
opt.expandtab = true
opt.shiftround = true
opt.shiftwidth = 0
opt.tabstop = 2
opt.mouse = 'nv'
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
opt.listchars = { tab = '» ', nbsp = '+', trail = '·', extends = '→', precedes = '←' }
opt.linebreak = true
opt.laststatus = 3
opt.wrap = false
opt.winborder = 'single'
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.termguicolors = true

opt.formatoptions:remove({ 'c', 'r', 'o' })
vim.api.nvim_create_autocmd('FileType', {
	callback = function() opt.formatoptions:remove({ 'c', 'r', 'o' }) end,
})

vim.g.mapleader = ' '
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- diable for no need
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
-- register filetypes
vim.filetype.add({ extension = { lsr = 'conf', tl = 'teal', surge = 'surge' } })
-- experimental feat: ext_ui
if vim.fn.has('nvim-0.12') == 1 then
	require('vim._core.ui2').enable({})
	vim.opt.cmdheight = 0
end
-- Colorscheme settings
vim.g.everforest_background = 'hard'
vim.g.everforest_float_style = 'blend'
vim.g.everforest_transparent_background = 2
vim.cmd('silent! colorscheme everforest')
require('core.options')

_G.momo = require('util')

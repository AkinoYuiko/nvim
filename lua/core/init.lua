vim.g.mapleader = ' '
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- diable for no need
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
-- experimental feat: ext_ui
require('vim._core.ui2').enable({})
require('core.options')

_G.momo = require('util')

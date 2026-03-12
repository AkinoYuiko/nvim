-- Colorscheme settings
vim.g.everforest_background = 'hard'
vim.g.everforest_float_style = 'blend'
vim.g.everforest_transparent_background = 2
pcall(vim.cmd.packadd, 'everforest')
pcall(vim.cmd.colorscheme, 'everforest')

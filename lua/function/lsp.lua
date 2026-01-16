-- vim.lsp.enable({ "emmylua_ls", "jsonls", "rust_analyzer", "stylua", "tinymist", "tombi", "ts_ls", "yamlls" })
vim.diagnostic.config({ virtual_text = true })
vim.filetype.add({ extension = { lsr = 'conf' } }) -- .lsr as .conf

require('keymap.lsp')

local lsp_tbl = {
	'bashls',
	'emmylua_ls',
	'fish_lsp',
	'jsonls',
	'rust_analyzer',
	'stylua',
	'tinymist',
	'tombi',
	'ts_ls',
	'yamlls',
}
vim.lsp.enable(lsp_tbl)
vim.diagnostic.config({ virtual_text = true })
vim.filetype.add({
	extension = {
		['lsr'] = 'conf',
		['yaml.docker-compose'] = 'yaml',
		['yaml.gitlab'] = 'yaml',
		['yaml.helm-values'] = 'yaml',
		['javascript.jsx'] = 'javascriptreact',
		['typescript.tsx'] = 'typescriptreact',
	},
}) -- .lsr as .conf

require('keymap.lsp')

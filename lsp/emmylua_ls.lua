---@type vim.lsp.Config
return {
	cmd = { 'emmylua_ls' },
	filetypes = { 'lua' },
	root_markers = { '.emmyrc.json', '.luarc.json', '.luacheckrc', '.git' },
	workspace_required = false,
	on_init = require('util').lua_ls_on_init,
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
}

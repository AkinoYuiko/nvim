local keys = {
	-- File/Package keymaps
	{ '<leader>e', MiniFiles.open},
	{ '<leader>f', ':Pick files<CR>' },
	{ '<leader>g', ':Pick grep_live<CR>' },
	{ '<leader>h', ':Pick help<CR>' },
	{ '<leader>b', ':Pick buffers<CR>' },
}

local keymap_set = vim.keymap.set
for _, map in ipairs(keys) do
	if type(map) ~= 'table' then return end
	keymap_set(map.mode or 'n', map[1], map[2], { desc = map.desc })
end

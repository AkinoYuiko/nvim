local M = {}

---@param keys table
M.map = function(keys)
	for _, map in ipairs(keys) do
		local opts = { desc = map.desc }
		if map.silent ~= nil then opts.silent = map.silent end
		if map.noremap ~= nil then
			opts.noremap = map.noremap
		else
			opts.noremap = true
		end
		if map.expr ~= nil then opts.expr = map.expr end

		local mode = map.mode or 'n'
		vim.keymap.set(mode, map[1], map[2], opts)
	end
end

---@param cmd string
M.cmd = function(cmd) return '<cmd>' .. cmd .. '<cr>' end

return M

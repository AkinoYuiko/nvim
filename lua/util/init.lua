local M = {}

M.mini = require('util.mini')
---@return boolean
M.nopack = function(name)
	if vim.v.progpath:match('/nix/store') ~= nil then return false end
	if pcall(vim.cmd.packadd, name) then return false end
	return true
end

return M

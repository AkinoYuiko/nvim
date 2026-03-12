local is_nix = vim.v.progpath:match("/nix/store") ~= nil
require('core')
require('function')
if is_nix then
	require('plugin')
end

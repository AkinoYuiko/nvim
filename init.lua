vim.g.mapleader = " "
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 0
vim.opt.tabstop = 2
vim.opt.mouse = "nv"
vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.termguicolors = true
-- Packages --
vim.pack.add({
	{ src = "https://github.com/neanias/everforest-nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/nvim-mini/mini.ai" },
	{ src = "https://github.com/nvim-mini/mini.completion" },
	{ src = "https://github.com/nvim-mini/mini.cmdline" },
	{ src = "https://github.com/nvim-mini/mini.files" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/nvim-mini/mini.keymap" },
	{ src = "https://github.com/nvim-mini/mini.notify" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.snippets" },
	{ src = "https://github.com/nvim-mini/mini.statusline" },
	{ src = "https://github.com/nvim-mini/mini.tabline" },
	{ src = "https://github.com/farmergreg/vim-lastplace" },
	{ src = "https://github.com/Darazaki/indent-o-matic" },
}, { confirm = false })
-- Colorscheme
require("everforest").setup({
	background = "hard",
	transparent_background_level = 2,
	show_eob = false,
})
vim.cmd.colorscheme("everforest")
-- Auto detect indents
require("indent-o-matic").setup({}) -- sbdx
-- Mini Packs Setup
local mini_modules = { "ai", "completion", "cmdline", "icons", "notify", "pick", "snippets", "statusline", "tabline" }
for _, mod in ipairs(mini_modules) do
	require("mini." .. mod).setup()
end
require("mini.files").setup({ windows = { preview = true } })
local ok, mini_keymap = pcall(require, "mini.keymap")
if ok then
	local map_multistep = mini_keymap.map_multistep
	if map_multistep ~= nil then
		map_multistep("i", "<Tab>", { "pmenu_next" })
		map_multistep("i", "<S-Tab>", { "pmenu_prev" })
		map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
	end
end
-- nvim-treesitter
-- local parsers = { "go", "rust", "json", "yaml", "toml", "nginx", "python", "typst", "typescript" }
-- require("nvim-treesitter").install(parsers)
-- Mason
require("mason").setup()
vim.schedule(require("mason-lspconfig").setup)
-- LSP Config --
vim.lsp.config("jsonls", { settings = { json = { allowComments = true } } })
-- vim.lsp.enable({ "emmylua_ls", "jsonls", "rust_analyzer", "stylua", "tinymist", "tombi", "ts_ls", "yamlls" })
vim.diagnostic.config({ virtual_text = true })
vim.filetype.add({ extension = { lsr = "conf" } }) -- .lsr as .conf
-- Key Mapping --
local keymap_set = vim.keymap.set
-- Format
keymap_set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format" })
-- Update
keymap_set("n", "<leader>up", function()
	vim.pack.update(nil, { force = true })
end, { desc = "Update packages" })
-- Personal
keymap_set({ "n", "v" }, ";", ":")
keymap_set({ "n", "v" }, "H", "^")
keymap_set({ "n", "v" }, "L", "g_")
keymap_set("n", "<leader>m", "<cmd>set nu! nu?<cr>")
keymap_set("n", "<leader>w", "<cmd>set wrap! wrap?<cr>")
keymap_set("n", "<leader>l", "<cmd>set list! list?<cr>")
-- System clipboard
keymap_set({ "n", "v" }, "<leader>c", '"+y', { desc = "copy to system clipboard" })
keymap_set({ "n", "v" }, "<leader>x", '"+d', { desc = "cut to system clipboard" })
keymap_set({ "n", "v" }, "<leader>p", '"+p', { desc = "paste to system clipboard" })
-- Window switch
-- keymap_set('n', '<leader>ww', '<C-w>w', { desc = 'focus windows' })
-- Line move
keymap_set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap_set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap_set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap_set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
-- File/Package keymaps
keymap_set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "open file explorer" })
keymap_set("n", "<leader>f", ":Pick files<CR>", { desc = "open file picker" })
keymap_set("n", "<leader>g", ":Pick grep_live<CR>", { desc = "open grep picker" })
keymap_set("n", "<leader>h", ":Pick help<CR>", { desc = "open help picker" })
keymap_set("n", "<leader>b", ":Pick buffers<CR>", { desc = "open buffer picker" })
keymap_set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "diagnostic messages" })
-- LSP keymaps
keymap_set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap_set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
keymap_set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap_set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
keymap_set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap_set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
-- Fast diagnostic
keymap_set("n", "[d", function()
	vim.diagnostic.jump({ wrap = true, count = -1 })
end, { desc = "prev diagnostic" })
keymap_set("n", "]d", function()
	vim.diagnostic.jump({ wrap = true, count = 1 })
end, { desc = "next diagnostic" })
-- AutoCmds --
local augroup_treesitter = vim.api.nvim_create_augroup("nvim.treesitter", { clear = true })
local augroup_yank = vim.api.nvim_create_augroup("highlight-yank", { clear = true })
-- Highlight Yanked Texts
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight copying text",
	group = augroup_yank,
	callback = function()
		vim.highlight.on_yank({ timeout = 500 })
	end,
})
-- treesitter
local ts = vim.treesitter
local ts_lang = ts.language
vim.api.nvim_create_autocmd("FileType", {
	group = augroup_treesitter,
	callback = function(ev)
		local lang = ts_lang.get_lang(ev.match)
		if lang and ts_lang.add(lang) then
			if pcall(ts.start, ev.buf, lang) then
				vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo.foldmethod = "expr"
				vim.wo.foldlevel = 99
			end
		end
	end,
})
-- nvim-treesitter TSUpdate
vim.api.nvim_create_autocmd("PackChanged", {
	group = augroup_treesitter,
	pattern = { "nvim-treesitter" },
	callback = function()
		vim.notify("Updating treesitter parsers", vim.log.levels.INFO)
		vim.schedule(function()
			local nvim_ts = require("nvim-treesitter")
			local update_promise = nvim_ts.update(nil, { summary = true })
			if update_promise and update_promise.wait then
				update_promise:wait(30 * 1000)
			end
		end)
	end,
})
-- auto recognize server_log.txt
vim.api.nvim_create_autocmd("BufRead", {
	pattern = "{client_log.txt, client_chat_log.txt, server_log.txt, server_chat_log.txt}",
	command = "set filetype=log",
})

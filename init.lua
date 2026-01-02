vim.g.mapleader = " "
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.fillchars = { eob = " " }
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.mouse = ""
vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false
vim.opt.termguicolors = true
-- lazy.nvim --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)
-- Packages --
require("lazy").setup({
	{
		"sainnhe/everforest",
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_transparent_background = 2
			vim.cmd.colorscheme("everforest")
		end,
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = { keymap = { preset = "super-tab" }, completion = { documentation = { auto_show = true } } },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local parsers = { "go", "rust", "json", "yaml", "toml", "nginx", "python", "typst", "typescript" }
			require("nvim-treesitter").install(parsers)
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					if vim.bo.filetype ~= "" and vim.treesitter.query.get(vim.bo.filetype, "highlights") then
						vim.treesitter.start()
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
	{ "neovim/nvim-lspconfig" },
	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			---@type string[]
			ensure_installed = {
				-- "bashls",
				-- "fish_lsp",
				"jsonls",
				"lua_ls",
				"stylua",
				"rust_analyzer",
				"ts_ls",
				"tinymist",
				"tombi",
				"yamlls",
			},
		},
	},
	{ "nvim-mini/mini.snippets", opts = {} },
	{ "nvim-mini/mini.statusline", opts = {} },
	{ "nvim-mini/mini.pick", opts = {} },
	{ "nvim-mini/mini.files", opts = { windows = { preview = true } } },
	{ "farmergreg/vim-lastplace", event = "BufReadPost" },
})
-- LSP Config --
vim.lsp.config("jsonls", { settings = { json = { allowComments = true } } })
vim.lsp.config(
	"lua_ls",
	{ settings = { Lua = { diagnostics = { globals = { "vim" } }, format = { enable = false } } } }
)
-- vim.lsp.enable({ ... })
vim.diagnostic.config({ virtual_text = true })
vim.filetype.add({ extension = { lsr = "conf" } }) -- .lsr as .conf
-- Key Mapping --
-- Format
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "format" })
-- Personal
vim.keymap.set({ "n", "v", "o" }, ";", ":")
vim.keymap.set({ "n", "v", "o" }, "H", "^")
vim.keymap.set({ "n", "v", "o" }, "L", "g_")
vim.keymap.set("n", "<leader>m", "<cmd>set nu! nu?<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>set wrap! wrap?<cr>")
vim.keymap.set("n", "<leader>l", "<cmd>set list! list?<cr>")
-- System clipboard
-- vim.keymap.set({ "n", "v" }, "<leader>c", '"+y', { desc = "copy to system clipboard" })
-- vim.keymap.set({ "n", "v" }, "<leader>x", '"+d', { desc = "cut to system clipboard" })
-- vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "paste to system clipboard" })
-- Window switch
-- vim.keymap.set('n', '<leader>ww', '<C-w>w', { desc = 'focus windows' })
-- Line move
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
-- Resize Window
-- vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
-- vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
-- vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
-- vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })
-- File/Package keymaps
vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "open file explorer" })
vim.keymap.set("n", "<leader>f", ":Pick files<CR>", { desc = "open file picker" })
vim.keymap.set("n", "<leader>h", ":Pick help<CR>", { desc = "open help picker" })
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>", { desc = "open buffer picker" })
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "diagnostic messages" })
-- LSP keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
-- Fast diagnostic
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ wrap = true, count = -1 })
end, { desc = "prev diagnostic" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ wrap = true, count = 1 })
end, { desc = "next diagnostic" })
-- AutoCmds --
-- Auto Formatting
-- vim.api.nvim_create_autocmd("BufWritePre", { callback = function() vim.lsp.buf.format() end, pattern = "*", })
-- Highlight Yanked Texts
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight copying text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 500 })
	end,
})

vim.g.mapleader = " "
vim.o.cursorline = true
vim.o.number = true
vim.o.swapfile = false
vim.o.wrap = false
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 0
vim.o.mouse = ""
vim.o.scrolloff = 5
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false
vim.o.termguicolors = true
----------------------
-- Packages --
----------------------
vim.pack.add({
	{ src = "https://github.com/neanias/everforest-nvim" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/Corn207/ts-query-loader.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-mini/mini.snippets" },
	{ src = "https://github.com/nvim-mini/mini.statusline" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.files" },
	{ src = "https://github.com/farmergreg/vim-lastplace" },
}, { confirm = false })
-- colorscheme
require("everforest").setup({ transparent_background_level = 2 })
vim.cmd.colorscheme("everforest")
-- blink.cmp
require("blink.cmp").setup({
	keymap = { preset = "super-tab" },
	completion = { documentation = { auto_show = true } },
})
-- mini packs
require("mini.snippets").setup()
require("mini.statusline").setup()
require("mini.pairs").setup()
require("mini.pick").setup()
require("mini.files").setup({ windows = { preview = true } })
-- treesitter loader
require("ts-query-loader").setup({
	ensure_installed = {
		"rust",
		"toml",
		"nginx",
		"typst",
		"typescript",
	},
})
-- Mason
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"tree-sitter-cli",
		"bashls",
		"jsonls",
		"lua_ls",
		"stylua",
		"rust_analyzer",
		"ts_ls",
		"tinymist",
		"tombi",
		"yamlls",
	},
	auto_update = true,
})
----------------------
-- LSP Config --
----------------------
vim.lsp.config("jsonls", {
	settings = {
		json = {
			allowComments = true,
			allowTrailingCommas = true,
		},
	},
})
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			-- runtime = {
			-- 	version = "LuaJIT",
			-- 	path = vim.split(package.path, ";"),
			-- },
			diagnostics = { globals = { "vim" } },
			-- workspace = {
			-- 	library = vim.api.nvim_get_runtime_file("", true),
			-- 	checkThirdParty = false,
			-- },
			format = { enable = false },
		},
	},
})
-- vim.lsp.enable(lsp_tbl)
vim.diagnostic.config({ virtual_text = true })
vim.filetype.add({ extension = { lsr = "conf" } }) -- .lsr as .conf
----------------------
-- Key Mapping --
----------------------
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
vim.keymap.set({ "n", "v" }, "<leader>c", '"+y', { desc = "copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"+d', { desc = "cut to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "paste to system clipboard" })
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
----------------------
-- AutoCmds --
----------------------
-- Auto Formatting
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
	pattern = "*",
})
-- Highlight Yanked Texts
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight copying text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 500 })
	end,
})
-- nvim-treesitter Auto Update Packages
vim.api.nvim_create_autocmd("PackChanged", {
	pattern = { "nvim-treesitter" },
	callback = function()
		vim.notify("Updating treesitter parsers", vim.log.levels.INFO)
		require("nvim-treesitter").update(nil, { summary = true }):wait(30 * 1000)
	end,
})

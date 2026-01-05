vim.g.mapleader = " "
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.fillchars = { eob = " " }
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
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
	{ src = "https://github.com/sainnhe/everforest" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
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
	{ src = "https://github.com/tpope/vim-sleuth" },
})
-- colorscheme
vim.g.everforest_background = "hard"
vim.g.everforest_transparent_background = 2
vim.cmd.colorscheme("everforest")
-- mini packs
for _, mod in ipairs({ "completion", "cmdline", "icons", "notify", "pick", "snippets", "statusline", "tabline" }) do
	require("mini." .. mod).setup()
end
require("mini.files").setup({ windows = { preview = true } })
local map_multistep = require("mini.keymap").map_multistep
if map_multistep ~= nil then
	map_multistep("i", "<Tab>", { "pmenu_next" })
	map_multistep("i", "<S-Tab>", { "pmenu_prev" })
	map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
end
-- nvim-treesitter
-- local parsers = { "go", "rust", "json", "yaml", "toml", "nginx", "python", "typst", "typescript" }
-- require("nvim-treesitter").instal(parsers)
-- mason
require("mason").setup()
require("mason-lspconfig").setup()
-- LSP Config --
vim.lsp.config("jsonls", { settings = { json = { allowComments = true } } })
-- vim.lsp.enable({ "jsonls", "emmylua_ls", "stylua", "rust_analyzer", "ts_ls", "tinymist", "tombi", "yamlls" })
vim.diagnostic.config({ virtual_text = true })
vim.filetype.add({ extension = { lsr = "conf" } }) -- .lsr as .conf
-- Key Mapping --
-- Format
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "format" })
-- Update
vim.keymap.set("n", "<leader>up", function()
	vim.pack.update(nil, { force = true })
end, { desc = "format" })
-- Personal
-- vim.keymap.set({ "n", "v" }, ";", ":")
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "g_")
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
-- File/Package keymaps
vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "open file explorer" })
vim.keymap.set("n", "<leader>f", ":Pick files<CR>", { desc = "open file picker" })
vim.keymap.set("n", "<leader>g", ":Pick grep_live<CR>", { desc = "open grep picker" })
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
-- treesitter
local augroup = vim.api.nvim_create_augroup("nvim.treesitter", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		if lang and vim.treesitter.language.add(lang) then
			if pcall(vim.treesitter.start, ev.buf, lang) then
				vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.wo.foldmethod = "expr"
				vim.wo.foldenable = false
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			end
		end
	end,
})
-- nvim-treesitter TSUpdate
vim.api.nvim_create_autocmd("PackChanged", {
	group = augroup,
	pattern = { "nvim-treesitter" },
	callback = function()
		vim.notify("Updating treesitter parsers", vim.log.levels.INFO)
		require("nvim-treesitter").update(nil, { summary = true }):wait(30 * 1000)
	end,
})

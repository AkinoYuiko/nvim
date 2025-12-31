-- 1 Basic Settings
vim.o.cursorline = true
vim.o.number = true
vim.o.swapfile = false
vim.o.wrap = false
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.mouse = ""
vim.o.scrolloff = 5
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99
vim.o.termguicolors = true
vim.g.mapleader = " "
-- Packages
vim.pack.add({
  { src = "https://github.com/akinoyuiko/lightline.vim" },
  { src = "https://github.com/sainnhe/everforest" },
  { src = "https://github.com/saghen/blink.cmp",               version = vim.version.range("^1") },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = "https://github.com/nvim-mini/mini.pick" },
  { src = "https://github.com/nvim-mini/mini.files" },
}, { confirm = false })
vim.g.lightline = { colorscheme = "everforest" }
vim.g.everforest_transparent_background = 2
vim.cmd.colorscheme("everforest")
-- nvim-treesitter
local ts = require("nvim-treesitter")
local augroup = vim.api.nvim_create_augroup("myconfig.treesitter", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = augroup,
-- 	pattern = { "*" },
-- 	callback = function(event)
-- 		local filetype = event.match
-- 		local lang = vim.treesitter.language.get_lang(filetype)
-- 		local is_installed, error = vim.treesitter.language.add(lang)
-- 		if not is_installed then
-- 			local available_langs = ts.get_available()
-- 			local is_available = vim.tbl_contains(available_langs, lang)
-- 			if is_available then
-- 				vim.notify("Installing treesitter parser for " .. lang, vim.log.levels.INFO)
-- 				ts.install({ lang }):wait(30 * 1000)
-- 			end
-- 		end
-- 		local ok, _ = pcall(vim.treesitter.start, event.buf, lang)
-- 		if not ok then
-- 			return
-- 		end
-- 		vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- 		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- 	end,
-- })
vim.api.nvim_create_autocmd("PackChanged", {
  group = augroup,
  pattern = { "nvim-treesitter" },
  callback = function()
    vim.notify("Updating treesitter parsers", vim.log.levels.INFO)
    ts.update(nil, { summary = true }):wait(30 * 1000)
  end,
})
-- blink.cmp 安装补全配置以及触发加载
require("blink.cmp").setup({
  fuzzy = { implementation = "prefer_rust_with_warning" },
  signature = { enabled = true },
  keymap = { preset = "super-tab" },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },
  sources = {
    -- default = { "lsp", "path", "snippets", "buffer" },
    default = { "lsp" },
  },
})
require('mason').setup()
require("mini.pick").setup()
require("mini.files").setup({ windows = { preview = true } })
----------------------
-- LSP Configuration
----------------------
vim.lsp.enable({
  "lua_ls",
  "rust-analyzer",
  "jsonls",
})
vim.diagnostic.config({ virtual_text = true }) -- 行内文本提示
-- vim.diagnostic.config({ virtual_lines = true }) -- 虚拟行提示（可选）
-- .lsr as .conf
vim.filetype.add({
  extension = { lsr = "conf" },
})
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
-- 系统剪贴板
vim.keymap.set({ "n", "v" }, "<leader>c", '"+y', { desc = "copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"+d', { desc = "cut to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "paste to system clipboard" })
-- 窗口切换
-- vim.keymap.set('n', '<leader>ww', '<C-w>w', { desc = 'focus windows' })
-- 行移动
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
-- 调整窗口大小
-- vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
-- vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
-- vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
-- vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })
-- 文件/插件快捷键
vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "open file explorer" })
vim.keymap.set("n", "<leader>f", ":Pick files<CR>", { desc = "open file picker" })
vim.keymap.set("n", "<leader>h", ":Pick help<CR>", { desc = "open help picker" })
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>", { desc = "open buffer picker" })
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "diagnostic messages" })
-- LSP 快捷键
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
-- 快速跳转诊断
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ wrap = true, count = -1 })
end, { desc = "prev diagnostic" })
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ wrap = true, count = 1 })
end, { desc = "next diagnostic" })
----------------------
-- 自动命令 --
----------------------
-- 保存前自动格式化
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end,
  pattern = "*",
})
-- 复制高亮提示
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight copying text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})

-- colors/everforest-dark-hard.lua
vim.cmd('highlight clear')
vim.o.termguicolors = true
vim.g.colors_name = 'everforest-dark-hard'

--------------------------------------------------
-- Palette (官方 dark hard - 完整版)
--------------------------------------------------
local c = {
	-- 背景色 (Dark Hard)
	bg_dim = '#1e2326',
	bg0 = '#272e33',
	bg1 = '#2e383c',
	bg2 = '#374145',
	bg3 = '#414b50',
	bg4 = '#495156',
	bg5 = '#4f5559',

	-- 前景色
	fg = '#d3c6aa',

	-- 灰度色
	grey0 = '#7a8478',
	grey1 = '#859289',
	grey2 = '#9da9a0',

	-- 主题色
	red = '#e67e80',
	orange = '#e69875',
	yellow = '#dbbc7f',
	green = '#a7c080',
	aqua = '#83c092',
	blue = '#7fbbb3',
	purple = '#d699b6',
}

local h = function(g, o) vim.api.nvim_set_hl(0, g, o) end

--------------------------------------------------
-- Core UI (透明度=2)
--------------------------------------------------
h('Normal', { fg = c.fg }) -- 透明背景
h('NormalNC', { fg = c.fg })
h('SignColumn', { fg = c.fg })
h('EndOfBuffer', { fg = c.bg0 })

-- CursorLine 覆盖 SignColumn / NumberColumn
h('CursorLine', { bg = c.bg1 })
h('CursorLineSign', { bg = c.bg1 })
h('CursorLineNr', { fg = c.yellow, bg = c.bg1, bold = true })

h('Visual', { bg = c.bg2 })
h('LineNr', { fg = c.grey1 })

-- StatusLine 和 StatusLineNC 背景改为透明 (透明度=2)
h('StatusLine', { fg = c.fg, bg = 'NONE' })
h('StatusLineNC', { fg = c.grey0, bg = 'NONE' })

-- Tabline 背景改为透明 (透明度=2)
h('TabLine', { fg = c.grey2, bg = 'NONE' })
h('TabLineSel', { fg = c.bg0, bg = c.red, bold = true })
h('TabLineFill', { bg = 'NONE' })

h('WinSeparator', { fg = c.bg3 })
h('VertSplit', { link = 'WinSeparator' })

h('ColorColumn', { bg = c.bg1 })

h('Folded', { fg = c.grey1, bg = c.bg1 })
h('FoldColumn', { fg = c.grey1 })

h('MatchParen', { fg = c.orange, bold = true })

h('Conceal', { fg = c.grey1, bg = 'NONE' })
h('Cursor', { reverse = true })
h('lCursor', { link = 'Cursor' })
h('CursorIM', { link = 'Cursor' })
h('TermCursor', { link = 'Cursor' })
h('TermCursorNC', { fg = c.fg, bg = c.bg1 })

--------------------------------------------------
-- Popup / Menu (官方对齐)
--------------------------------------------------
h('NormalFloat', { fg = c.fg, bg = c.bg0 })
h('FloatBorder', { fg = c.grey1, bg = c.bg0 })
h('Pmenu', { fg = c.fg, bg = c.bg0 })
h('PmenuSel', { fg = c.bg0, bg = c.blue, bold = true })
h('PmenuSbar', { bg = c.bg1 })
h('PmenuThumb', { bg = c.grey1 })

--------------------------------------------------
-- Search
--------------------------------------------------
h('Search', { fg = c.bg0, bg = c.yellow })
h('IncSearch', { fg = c.bg0, bg = c.orange })
h('CurSearch', { link = 'IncSearch' })
h('Substitute', { fg = c.bg0, bg = c.yellow })

--------------------------------------------------
-- Syntax (官方语义)
--------------------------------------------------
h('Comment', { fg = c.grey0, italic = true })

h('Constant', { fg = c.orange })
h('String', { fg = c.green })
h('Character', { fg = c.aqua })
h('Number', { fg = c.purple })
h('Boolean', { fg = c.purple })
h('Float', { fg = c.purple })

h('Identifier', { fg = c.blue })
h('Function', { fg = c.green })

h('Statement', { fg = c.red })
h('Conditional', { fg = c.red })
h('Repeat', { fg = c.red })
h('Label', { fg = c.red })
h('Operator', { fg = c.orange })
h('Keyword', { fg = c.red })
h('Exception', { fg = c.red })

h('PreProc', { fg = c.purple })
h('Include', { fg = c.purple })
h('Define', { fg = c.purple })
h('Macro', { fg = c.purple })
h('PreCondit', { fg = c.purple })

h('Type', { fg = c.yellow })
h('StorageClass', { fg = c.yellow })
h('Structure', { fg = c.yellow })
h('Typedef', { fg = c.yellow })

h('Special', { fg = c.orange })
h('SpecialChar', { fg = c.orange })
h('Tag', { fg = c.orange })
h('Delimiter', { fg = c.fg })
h('SpecialComment', { fg = c.grey0, italic = true })
h('Debug', { fg = c.orange })

h('Underlined', { fg = c.blue, underline = true })
h('Ignore', { fg = c.grey1 })
h('Error', { fg = c.red, bold = true })
h('Todo', { fg = c.bg0, bg = c.yellow, bold = true })

--------------------------------------------------
-- Treesitter (官方语义映射)
--------------------------------------------------
h('@variable', { fg = c.fg })
h('@variable.builtin', { fg = c.purple })
h('@variable.parameter', { fg = c.fg })
h('@variable.member', { fg = c.fg })

h('@constant', { fg = c.orange })
h('@constant.builtin', { fg = c.purple })
h('@constant.macro', { fg = c.purple })

h('@module', { fg = c.blue })
h('@label', { fg = c.red })

h('@string', { fg = c.green })
h('@string.regexp', { fg = c.aqua })
h('@string.escape', { fg = c.aqua })
h('@string.special', { fg = c.aqua })
h('@character', { fg = c.aqua })
h('@character.special', { fg = c.aqua })

h('@number', { fg = c.purple })
h('@number.float', { fg = c.purple })
h('@boolean', { fg = c.purple })

h('@function', { fg = c.green })
h('@function.builtin', { fg = c.blue })
h('@function.call', { fg = c.green })
h('@function.macro', { fg = c.green })
h('@function.method', { fg = c.green })
h('@function.method.call', { fg = c.green })

h('@constructor', { fg = c.yellow })
h('@operator', { fg = c.orange })

h('@keyword', { fg = c.red })
h('@keyword.function', { fg = c.red })
h('@keyword.operator', { fg = c.red })
h('@keyword.return', { fg = c.red })
h('@keyword.exception', { fg = c.red })

h('@type', { fg = c.yellow })
h('@type.builtin', { fg = c.yellow })
h('@type.definition', { fg = c.yellow })
h('@type.qualifier', { fg = c.red })

h('@property', { fg = c.fg })
h('@attribute', { fg = c.purple })

h('@comment', { link = 'Comment' })
h('@comment.error', { fg = c.bg0, bg = c.red })
h('@comment.warning', { fg = c.bg0, bg = c.yellow })
h('@comment.todo', { fg = c.bg0, bg = c.blue })
h('@comment.note', { fg = c.bg0, bg = c.aqua })

h('@punctuation.delimiter', { fg = c.fg })
h('@punctuation.bracket', { fg = c.fg })
h('@punctuation.special', { fg = c.orange })

h('@tag', { fg = c.orange })
h('@tag.attribute', { fg = c.yellow })
h('@tag.delimiter', { fg = c.fg })

--------------------------------------------------
-- LSP Semantic Tokens
--------------------------------------------------
h('@lsp.type.class', { link = '@type' })
h('@lsp.type.decorator', { link = '@function' })
h('@lsp.type.enum', { link = '@type' })
h('@lsp.type.enumMember', { link = '@constant' })
h('@lsp.type.function', { link = '@function' })
h('@lsp.type.interface', { link = '@type' })
h('@lsp.type.macro', { link = '@macro' })
h('@lsp.type.method', { link = '@function.method' })
h('@lsp.type.namespace', { link = '@module' })
h('@lsp.type.parameter', { link = '@variable.parameter' })
h('@lsp.type.property', { link = '@property' })
h('@lsp.type.struct', { link = '@type' })
h('@lsp.type.type', { link = '@type' })
h('@lsp.type.typeParameter', { link = '@type.definition' })
h('@lsp.type.variable', { link = '@variable' })

--------------------------------------------------
-- Diff / Git
--------------------------------------------------
h('DiffAdd', { fg = c.green, bg = 'NONE' })
h('DiffChange', { fg = c.blue, bg = 'NONE' })
h('DiffDelete', { fg = c.red, bg = 'NONE' })
h('DiffText', { fg = c.yellow, bg = c.bg1, bold = true })

h('diffAdded', { fg = c.green })
h('diffRemoved', { fg = c.red })
h('diffChanged', { fg = c.blue })
h('diffFile', { fg = c.orange })
h('diffNewFile', { fg = c.yellow })
h('diffLine', { fg = c.blue })

--------------------------------------------------
-- Diagnostics / Messages
--------------------------------------------------
h('DiagnosticError', { fg = c.red })
h('DiagnosticWarn', { fg = c.yellow })
h('DiagnosticInfo', { fg = c.blue })
h('DiagnosticHint', { fg = c.aqua })
h('DiagnosticOk', { fg = c.green })

h('DiagnosticSignError', { fg = c.red, bg = 'NONE' })
h('DiagnosticSignWarn', { fg = c.yellow, bg = 'NONE' })
h('DiagnosticSignInfo', { fg = c.blue, bg = 'NONE' })
h('DiagnosticSignHint', { fg = c.aqua, bg = 'NONE' })

h('DiagnosticUnderlineError', { undercurl = true, sp = c.red })
h('DiagnosticUnderlineWarn', { undercurl = true, sp = c.yellow })
h('DiagnosticUnderlineInfo', { undercurl = true, sp = c.blue })
h('DiagnosticUnderlineHint', { undercurl = true, sp = c.aqua })

h('ErrorMsg', { fg = c.red, bold = true })
h('WarningMsg', { fg = c.yellow, bold = true })
h('MoreMsg', { fg = c.green, bold = true })
h('Question', { fg = c.aqua, bold = true })
h('ModeMsg', { fg = c.fg, bold = true })

--------------------------------------------------
-- Spell
--------------------------------------------------
h('SpellBad', { undercurl = true, sp = c.red })
h('SpellCap', { undercurl = true, sp = c.yellow })
h('SpellRare', { undercurl = true, sp = c.blue })
h('SpellLocal', { undercurl = true, sp = c.aqua })

--------------------------------------------------
-- Misc UI
--------------------------------------------------
h('Title', { fg = c.orange, bold = true })
h('Directory', { fg = c.blue })
h('SpecialKey', { fg = c.grey1 })
h('NonText', { fg = c.bg3 })
h('Whitespace', { fg = c.bg3 })

h('QuickFixLine', { fg = c.bg0, bg = c.blue, bold = true })
h('qfLineNr', { fg = c.yellow })
h('qfFileName', { fg = c.blue })

--------------------------------------------------
-- mini.nvim (官方视觉对齐)
--------------------------------------------------

-- MiniStatusline (官方配色: Normal=green, Insert=blue, Visual=orange)
h('MiniStatuslineModeNormal', { fg = c.bg0, bg = c.green, bold = true })
h('MiniStatuslineModeInsert', { fg = c.bg0, bg = c.blue, bold = true })
h('MiniStatuslineModeVisual', { fg = c.bg0, bg = c.orange, bold = true })
h('MiniStatuslineModeReplace', { fg = c.bg0, bg = c.red, bold = true })
h('MiniStatuslineModeCommand', { fg = c.bg0, bg = c.yellow, bold = true })
h('MiniStatuslineModeOther', { fg = c.bg0, bg = c.aqua, bold = true })
h('MiniStatuslineDevinfo', { fg = c.fg, bg = c.bg2 })
h('MiniStatuslineFilename', { fg = c.fg, bg = c.bg1 })
h('MiniStatuslineFileinfo', { fg = c.fg, bg = c.bg2 })
h('MiniStatuslineInactive', { fg = c.grey0, bg = c.bg0 })

-- MiniTabline (完整版 - 包含 Modified 状态)
h('MiniTablineCurrent', { fg = c.fg, bg = c.bg4, bold = true })
h('MiniTablineVisible', { fg = c.fg, bg = c.bg2 })
h('MiniTablineHidden', { fg = c.grey1, bg = c.bg2 })
h('MiniTablineModifiedCurrent', { fg = c.blue, bg = c.bg4, bold = true })
h('MiniTablineModifiedVisible', { fg = c.blue, bg = c.bg2 })
h('MiniTablineModifiedHidden', { fg = c.grey1, bg = c.bg2 })
h('MiniTablineFill', { bg = c.bg0 })
h('MiniTablineTabpagesection', { fg = c.bg0, bg = c.blue, bold = true })

-- MiniIndentscope
h('MiniIndentscopeSymbol', { fg = c.grey1 })
h('MiniIndentscopePrefix', { nocombine = true })

-- MiniNotify
h('MiniNotifyNormal', { fg = c.fg, bg = c.bg2 })
h('MiniNotifyBorder', { fg = c.grey1, bg = c.bg2 })
h('MiniNotifyTitle', { fg = c.blue, bold = true })

-- MiniPick
h('MiniPickNormal', { fg = c.fg, bg = c.bg0 })
h('MiniPickBorder', { fg = c.grey1, bg = c.bg0 })
h('MiniPickBorderBusy', { fg = c.yellow, bg = c.bg0 })
h('MiniPickBorderText', { fg = c.aqua, bg = c.bg0 })
h('MiniPickPrompt', { fg = c.blue, bg = c.bg0, bold = true })
h('MiniPickMatchCurrent', { bg = c.bg2 })
h('MiniPickMatchMarked', { fg = c.orange, bold = true })
h('MiniPickMatchRanges', { fg = c.yellow, bold = true })
h('MiniPickHeader', { fg = c.grey1 })
h('MiniPickIconDirectory', { fg = c.blue })
h('MiniPickIconFile', { fg = c.fg })
h('MiniPickPreviewLine', { bg = c.bg2 })
h('MiniPickPreviewRegion', { bg = c.bg3 })

-- MiniFiles
h('MiniFilesNormal', { fg = c.fg, bg = c.bg0 })
h('MiniFilesBorder', { fg = c.grey1, bg = c.bg0 })
h('MiniFilesBorderModified', { fg = c.yellow, bg = c.bg0 })
h('MiniFilesCursorLine', { bg = c.bg2 })
h('MiniFilesDirectory', { fg = c.blue })
h('MiniFilesFile', { fg = c.fg })
h('MiniFilesTitle', { fg = c.blue, bold = true })
h('MiniFilesTitleFocused', { fg = c.bg0, bg = c.blue, bold = true })

-- MiniClue
h('MiniClueNormal', { fg = c.fg, bg = c.bg0 })
h('MiniClueBorder', { fg = c.grey1, bg = c.bg0 })
h('MiniClueDescGroup', { fg = c.yellow, bold = true })
h('MiniClueDescSeparator', { fg = c.grey1 })
h('MiniClueNextKey', { fg = c.green, bold = true })
h('MiniClueNextKeyWithPostkeys', { fg = c.aqua, bold = true })
h('MiniClueSeparator', { fg = c.grey1 })
h('MiniClueTitle', { fg = c.blue, bold = true })

-- MiniJump
h('MiniJump', { fg = c.bg0, bg = c.purple, bold = true })

-- MiniStarter
h('MiniStarterCurrent', { nocombine = true })
h('MiniStarterFooter', { fg = c.grey0, italic = true })
h('MiniStarterHeader', { fg = c.green, bold = true })
h('MiniStarterInactive', { fg = c.grey0 })
h('MiniStarterItem', { fg = c.fg })
h('MiniStarterItemBullet', { fg = c.grey1 })
h('MiniStarterItemPrefix', { fg = c.yellow })
h('MiniStarterSection', { fg = c.blue, bold = true })
h('MiniStarterQuery', { fg = c.aqua })

-- MiniDiff
h('MiniDiffSignAdd', { fg = c.green, bg = 'NONE' })
h('MiniDiffSignChange', { fg = c.blue, bg = 'NONE' })
h('MiniDiffSignDelete', { fg = c.red, bg = 'NONE' })
h('MiniDiffOverAdd', { bg = c.bg1 })
h('MiniDiffOverChange', { bg = c.bg1 })
h('MiniDiffOverContext', { bg = c.bg1 })
h('MiniDiffOverDelete', { bg = c.bg1 })

-- MiniHipatterns
h('MiniHipatternsFixme', { fg = c.bg0, bg = c.red, bold = true })
h('MiniHipatternsHack', { fg = c.bg0, bg = c.yellow, bold = true })
h('MiniHipatternsTodo', { fg = c.bg0, bg = c.blue, bold = true })
h('MiniHipatternsNote', { fg = c.bg0, bg = c.aqua, bold = true })

--------------------------------------------------
-- 额外常用插件支持
--------------------------------------------------

-- Telescope (如果使用)
h('TelescopeNormal', { fg = c.fg, bg = c.bg0 })
h('TelescopeBorder', { fg = c.grey1, bg = c.bg0 })
h('TelescopePromptNormal', { fg = c.fg, bg = c.bg1 })
h('TelescopePromptBorder', { fg = c.bg1, bg = c.bg1 })
h('TelescopePromptTitle', { fg = c.bg0, bg = c.blue, bold = true })
h('TelescopePreviewTitle', { fg = c.bg0, bg = c.green, bold = true })
h('TelescopeResultsTitle', { fg = c.bg0, bg = c.grey1, bold = true })
h('TelescopeSelection', { fg = c.fg, bg = c.bg2, bold = true })
h('TelescopeMatching', { fg = c.orange, bold = true })

-- NvimTree (如果使用)
h('NvimTreeNormal', { fg = c.fg, bg = c.bg0 })
h('NvimTreeFolderName', { fg = c.blue })
h('NvimTreeFolderIcon', { fg = c.blue })
h('NvimTreeOpenedFolderName', { fg = c.blue, bold = true })
h('NvimTreeRootFolder', { fg = c.orange, bold = true })
h('NvimTreeGitDirty', { fg = c.yellow })
h('NvimTreeGitNew', { fg = c.green })
h('NvimTreeGitDeleted', { fg = c.red })

-- GitSigns (如果使用)
h('GitSignsAdd', { fg = c.green, bg = 'NONE' })
h('GitSignsChange', { fg = c.blue, bg = 'NONE' })
h('GitSignsDelete', { fg = c.red, bg = 'NONE' })

-- Which-key (如果使用)
h('WhichKey', { fg = c.green })
h('WhichKeyGroup', { fg = c.blue })
h('WhichKeyDesc', { fg = c.fg })
h('WhichKeySeparator', { fg = c.grey1 })
h('WhichKeyFloat', { bg = c.bg0 })
h('WhichKeyBorder', { fg = c.grey1, bg = c.bg0 })

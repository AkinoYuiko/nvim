-- colors/everforest-dark-hard.lua
-- Everforest Dark Hard
-- Based on:
--   1. sainnhe/everforest (official Vim version)
--   2. neanias/everforest-nvim (official Neovim version)
-- Transparent background level: 2

vim.cmd('highlight clear')
vim.o.termguicolors = true
vim.g.colors_name = 'everforest-dark-hard'

-----------------------------------------------------------------------
-- Color palette (dark hard)
-----------------------------------------------------------------------
local c = {
	bg_dim = '#1e2326',
	bg0 = '#272e33',
	bg1 = '#2e383c',
	bg2 = '#374145',
	bg3 = '#414b50',
	bg4 = '#495156',
	bg5 = '#4f5559',

	fg = '#d3c6aa',
	grey0 = '#7a8478',
	grey1 = '#859289',
	grey2 = '#9da9a0',

	red = '#e67e80',
	orange = '#e69875',
	yellow = '#dbbc7f',
	green = '#a7c080',
	aqua = '#83c092',
	blue = '#7fbbb3',
	purple = '#d699b6',
}

local h = function(group, opts) vim.api.nvim_set_hl(0, group, opts) end

-----------------------------------------------------------------------
-- Core UI (unchanged)
-----------------------------------------------------------------------
h('Normal', { fg = c.fg })
h('NormalNC', { fg = c.fg })
h('NormalSB', { fg = c.fg })
h('SignColumn', { fg = c.fg })
h('EndOfBuffer', { fg = c.bg0 })
h('NonText', { fg = c.bg3 })
h('Whitespace', { fg = c.bg3 })
h('LineNr', { fg = c.grey1 })

h('CursorLine', { bg = c.bg1 })
h('CursorLineNr', { fg = c.yellow, bg = c.bg1, bold = true })
h('CursorLineSign', { bg = c.bg1 })
h('CursorLineFold', { bg = c.bg1 })
h('CursorColumn', { bg = c.bg1 })
h('ColorColumn', { bg = c.bg1 })

h('Visual', { bg = c.bg2 })
h('VisualNOS', { bg = c.bg2 })
h('Folded', { fg = c.grey1, bg = c.bg1 })
h('FoldColumn', { fg = c.grey2, bg = c.bg1 })
h('MatchParen', { fg = c.orange, bold = true })
h('Conceal', { fg = c.grey1 })

-----------------------------------------------------------------------
-- Statusline / Tabline / Window separators
-----------------------------------------------------------------------

h('StatusLine', { fg = c.fg })
h('StatusLineNC', { fg = c.grey0 })

h('TabLine', { fg = c.grey2 })
h('TabLineSel', { fg = c.bg0, bg = c.red, bold = true })
h('TabLineFill', { bg = c.bg0 })

h('WinSeparator', { fg = c.bg3 })
h('WinSeparatorNC', { fg = c.bg3 })
h('VertSplit', { link = 'WinSeparator' })

-----------------------------------------------------------------------
-- Messages / Cmdline
-----------------------------------------------------------------------

h('MsgArea', { fg = c.fg })
h('MsgSeparator', { fg = c.bg3 })

h('ErrorMsg', { fg = c.red, bold = true })
h('WarningMsg', { fg = c.yellow, bold = true })
h('MoreMsg', { fg = c.yellow })
h('ModeMsg', { fg = c.fg })
h('Question', { fg = c.aqua, bold = true })

-----------------------------------------------------------------------
-- Floating windows / Popup menu
-----------------------------------------------------------------------

h('NormalFloat', { fg = c.fg, bg = c.bg0 })
h('FloatBorder', { fg = c.grey1, bg = c.bg0 })
h('FloatTitle', { fg = c.orange, bg = c.bg0, bold = true })
h('FloatShadow', { bg = c.bg_dim })
h('FloatShadowThrough', { bg = c.bg_dim })

h('Pmenu', { fg = c.fg, bg = c.bg0 })
h('PmenuSel', { fg = c.bg0, bg = c.green, bold = true })
h('PmenuSbar', { bg = c.bg1 })
h('PmenuThumb', { bg = c.grey1 })
h('PmenuExtra', { fg = c.grey1, bg = c.bg0 })
h('PmenuExtraSel', { fg = c.bg0, bg = c.green })

-----------------------------------------------------------------------
-- Search
-----------------------------------------------------------------------
h('Search', { fg = c.bg0, bg = c.green })
h('IncSearch', { fg = c.bg0, bg = c.red })
h('CurSearch', { link = 'IncSearch' })
h('Substitute', { fg = c.bg0, bg = c.yellow })

-----------------------------------------------------------------------
-- Syntax (classic Vim groups)
-----------------------------------------------------------------------
h('Comment', { fg = c.grey1, italic = true })
h('Constant', { fg = c.aqua })
h('String', { fg = c.green })
h('Character', { fg = c.green })
h('Number', { fg = c.purple })
h('Boolean', { fg = c.purple })
h('Float', { fg = c.purple })

h('Identifier', { fg = c.blue })
h('Function', { fg = c.green })

h('Statement', { fg = c.red })
h('Conditional', { fg = c.red })
h('Repeat', { fg = c.red })
h('Keyword', { fg = c.red })
h('Exception', { fg = c.red })

h('Label', { fg = c.orange })
h('Operator', { fg = c.orange })

h('PreProc', { fg = c.purple })
h('Include', { fg = c.purple })
h('Define', { fg = c.purple })
h('Macro', { fg = c.purple })
h('PreCondit', { fg = c.purple })

h('Type', { fg = c.yellow })
h('StorageClass', { fg = c.orange })
h('Structure', { fg = c.yellow })
h('Typedef', { fg = c.yellow })

h('Special', { fg = c.yellow })
h('SpecialChar', { fg = c.yellow })
h('Tag', { fg = c.orange })
h('Delimiter', { fg = c.fg })

h('Underlined', { fg = c.blue, underline = true })
h('Ignore', { fg = c.grey1 })
h('Error', { fg = c.red, bold = true })
h('Todo', { fg = c.purple, bold = true })

-----------------------------------------------------------------------
-- Treesitter
-----------------------------------------------------------------------
h('@variable', { fg = c.fg })
h('@variable.builtin', { fg = c.yellow })
h('@variable.parameter', { fg = c.fg })
h('@variable.member', { fg = c.fg })

h('@constant', { fg = c.aqua })
h('@constant.builtin', { fg = c.aqua })
h('@constant.macro', { fg = c.aqua })

h('@module', { fg = c.yellow })
h('@namespace', { link = '@module' })

h('@string', { fg = c.green })
h('@string.escape', { fg = c.orange })
h('@string.special', { fg = c.yellow })
h('@string.regexp', { fg = c.green })
h('@string.special.url', { fg = c.blue, underline = true })

h('@number', { fg = c.purple })
h('@boolean', { fg = c.purple })

h('@function', { fg = c.green })
h('@function.builtin', { fg = c.green })
h('@function.method', { fg = c.green })
h('@constructor', { fg = c.green })

h('@operator', { fg = c.orange })

h('@keyword', { fg = c.red })
h('@keyword.conditional', { fg = c.red })
h('@keyword.repeat', { fg = c.red })
h('@keyword.return', { fg = c.red })
h('@keyword.exception', { fg = c.red })

h('@conditional', { link = '@keyword.conditional' })
h('@repeat', { link = '@keyword.repeat' })
h('@exception', { link = '@keyword.exception' })

h('@type', { fg = c.yellow })
h('@type.builtin', { fg = c.yellow })
h('@type.definition', { fg = c.yellow })
h('@type.qualifier', { fg = c.orange })

h('@attribute', { fg = c.yellow })
h('@property', { fg = c.fg })

h('@punctuation', { fg = c.grey2 })
h('@punctuation.bracket', { fg = c.fg })

h('@comment', { link = 'Comment' })

-----------------------------------------------------------------------
-- Tree-sitter full compatibility (new TS + legacy TS + nvim-treesitter)
-----------------------------------------------------------------------

-- ===============================================================
-- New Tree-sitter markup (Neovim >= 0.9)
-- ===============================================================
h('@markup', { fg = c.fg })
h('@markup.strong', { bold = true })
h('@markup.italic', { italic = true })
h('@markup.strikethrough', { strikethrough = true })
h('@markup.underline', { underline = true })

h('@markup.heading', { fg = c.orange, bold = true })
h('@markup.heading.1', { fg = c.red, bold = true })
h('@markup.heading.2', { fg = c.orange, bold = true })
h('@markup.heading.3', { fg = c.yellow, bold = true })
h('@markup.heading.4', { fg = c.green, bold = true })
h('@markup.heading.5', { fg = c.aqua, bold = true })
h('@markup.heading.6', { fg = c.blue, bold = true })

h('@markup.quote', { fg = c.grey1, italic = true })
h('@markup.math', { fg = c.blue })
h('@markup.raw', { fg = c.green })
h('@markup.raw.block', { fg = c.green })
h('@markup.raw.inline', { fg = c.green })

h('@markup.list', { fg = c.orange })
h('@markup.list.checked', { fg = c.green })
h('@markup.list.unchecked', { fg = c.grey1 })

h('@markup.link', { fg = c.blue })
h('@markup.link.label', { fg = c.blue })
h('@markup.link.url', { fg = c.blue, underline = true })

-- ===============================================================
-- Tags (HTML / JSX / TSX / XML)
-- ===============================================================
h('@tag', { fg = c.red })
h('@tag.attribute', { fg = c.yellow })
h('@tag.delimiter', { fg = c.grey1 })

-- ===============================================================
-- Diff / Git (Tree-sitter based)
-- ===============================================================
h('@diff.plus', { fg = c.green })
h('@diff.minus', { fg = c.red })
h('@diff.delta', { fg = c.blue })

-- ===============================================================
-- Injected languages
-- ===============================================================
h('@injection', { fg = c.fg })
h('@injection.content', { fg = c.fg })
h('@injection.language', { fg = c.purple })

-- ===============================================================
-- Conceal / Spell
-- ===============================================================
h('@conceal', { fg = c.grey1 })
h('@spell', { fg = c.red, underline = true })

-- ===============================================================
-- Legacy Tree-sitter (@text.*) used by nvim-treesitter
-- ===============================================================
h('@text', { link = '@markup' })
h('@text.strong', { link = '@markup.strong' })
h('@text.emphasis', { link = '@markup.italic' })
h('@text.underline', { link = '@markup.underline' })
h('@text.strike', { link = '@markup.strikethrough' })

h('@text.title', { link = '@markup.heading' })
h('@text.literal', { link = '@markup.raw' })
h('@text.uri', { link = '@markup.link.url' })
h('@text.reference', { link = '@markup.link' })
h('@text.math', { link = '@markup.math' })
h('@text.environment', { link = '@markup.environment' })
h('@text.environment.name', { link = '@markup.environment' })

h('@text.todo', { link = 'Todo' })
h('@text.warning', { fg = c.yellow, bold = true })
h('@text.danger', { fg = c.red, bold = true })
h('@text.note', { fg = c.blue, bold = true })

-- ===============================================================
-- nvim-treesitter context / UI helpers
-- ===============================================================
h('TreesitterContext', { bg = c.bg1 })
h('TreesitterContextLineNumber', { fg = c.grey2 })

-- ===============================================================
-- Rainbow delimiters (if enabled)
-- ===============================================================
h('RainbowDelimiterRed', { fg = c.red })
h('RainbowDelimiterOrange', { fg = c.orange })
h('RainbowDelimiterYellow', { fg = c.yellow })
h('RainbowDelimiterGreen', { fg = c.green })
h('RainbowDelimiterBlue', { fg = c.blue })
h('RainbowDelimiterViolet', { fg = c.purple })
h('RainbowDelimiterCyan', { fg = c.aqua })

-----------------------------------------------------------------------
-- LSP semantic tokens
-----------------------------------------------------------------------
h('@lsp.type.class', { link = '@type' })
h('@lsp.type.interface', { link = '@type' })
h('@lsp.type.enum', { link = '@type' })
h('@lsp.type.function', { link = '@function' })
h('@lsp.type.method', { link = '@function.method' })
h('@lsp.type.decorator', { link = '@attribute' })
h('@lsp.type.event', { link = '@type' })
h('@lsp.type.variable', { link = '@variable' })
h('@lsp.type.property', { link = '@property' })

-----------------------------------------------------------------------
-- LSP UI
-----------------------------------------------------------------------
h('DiagnosticError', { fg = c.red })
h('DiagnosticWarn', { fg = c.yellow })
h('DiagnosticInfo', { fg = c.blue })
h('DiagnosticHint', { fg = c.aqua })
h('DiagnosticOk', { fg = c.green })

h('DiagnosticSignError', { fg = c.red })
h('DiagnosticSignWarn', { fg = c.yellow })
h('DiagnosticSignInfo', { fg = c.blue })
h('DiagnosticSignHint', { fg = c.aqua })

h('DiagnosticVirtualTextError', { fg = c.red })
h('DiagnosticVirtualTextWarn', { fg = c.yellow })
h('DiagnosticVirtualTextInfo', { fg = c.blue })
h('DiagnosticVirtualTextHint', { fg = c.aqua })

h('DiagnosticUnderlineError', { undercurl = true, sp = c.red })
h('DiagnosticUnderlineWarn', { undercurl = true, sp = c.yellow })
h('DiagnosticUnderlineInfo', { undercurl = true, sp = c.blue })
h('DiagnosticUnderlineHint', { undercurl = true, sp = c.aqua })

h('LspReferenceText', { bg = c.bg2 })
h('LspReferenceRead', { bg = c.bg2 })
h('LspReferenceWrite', { bg = c.bg2 })

h('LspInlayHint', { fg = c.grey0 })
h('LspCodeLens', { fg = c.grey0 })
h('LspSignatureActiveParameter', { fg = c.orange, bold = true })

-----------------------------------------------------------------------
-- Completion UI (nvim-cmp, snippets, ghost text)
-----------------------------------------------------------------------

-- Completion menu base
h('CmpItemAbbr', { fg = c.fg })
h('CmpItemAbbrDeprecated', { fg = c.grey1, strikethrough = true })
h('CmpItemAbbrMatch', { fg = c.blue, bold = true })
h('CmpItemAbbrMatchFuzzy', { fg = c.blue, bold = true })

h('CmpItemMenu', { fg = c.grey1 })

-- Kind highlighting (align with LSP / Treesitter semantics)
h('CmpItemKindText', { fg = c.fg })
h('CmpItemKindMethod', { fg = c.green })
h('CmpItemKindFunction', { fg = c.green })
h('CmpItemKindConstructor', { fg = c.green })

h('CmpItemKindField', { fg = c.fg })
h('CmpItemKindVariable', { fg = c.fg })
h('CmpItemKindProperty', { fg = c.fg })

h('CmpItemKindClass', { fg = c.yellow })
h('CmpItemKindInterface', { fg = c.yellow })
h('CmpItemKindStruct', { fg = c.yellow })
h('CmpItemKindEnum', { fg = c.yellow })
h('CmpItemKindEnumMember', { fg = c.aqua })

h('CmpItemKindModule', { fg = c.yellow })
h('CmpItemKindNamespace', { fg = c.yellow })

h('CmpItemKindKeyword', { fg = c.red })
h('CmpItemKindOperator', { fg = c.orange })

h('CmpItemKindConstant', { fg = c.aqua })
h('CmpItemKindValue', { fg = c.aqua })

h('CmpItemKindString', { fg = c.green })
h('CmpItemKindNumber', { fg = c.purple })
h('CmpItemKindBoolean', { fg = c.purple })

h('CmpItemKindFile', { fg = c.blue })
h('CmpItemKindFolder', { fg = c.blue })

h('CmpItemKindSnippet', { fg = c.purple })

-- Documentation window (fully align with NormalFloat)
h('CmpDocumentation', { link = 'NormalFloat' })
h('CmpDocumentationBorder', { link = 'FloatBorder' })

-- Ghost text (inline suggestion)
h('CmpGhostText', { fg = c.grey0, italic = true })

-- Snippet placeholders (LuaSnip / VSCode style)
h('SnippetTabstop', { fg = c.orange, underline = true })
h('SnippetPlaceholder', { fg = c.orange, underline = true })

-- Fallbacks for older configs
h('CmpItemKindDefault', { fg = c.fg })

-----------------------------------------------------------------------
-- Diff / Git
-----------------------------------------------------------------------
h('DiffAdd', { fg = c.green })
h('DiffChange', { fg = c.blue })
h('DiffDelete', { fg = c.red })
h('DiffText', { fg = c.yellow, bg = c.bg1, bold = true })

-----------------------------------------------------------------------
-- Quickfix
-----------------------------------------------------------------------
h('QuickFixLine', { fg = c.bg0, bg = c.blue, bold = true })
h('qfLineNr', { fg = c.yellow })
h('qfFileName', { fg = c.blue })

-----------------------------------------------------------------------
-- mini.nvim UI
-----------------------------------------------------------------------

-- Statusline
h('MiniStatuslineModeNormal', { fg = c.bg0, bg = c.green, bold = true })
h('MiniStatuslineModeInsert', { fg = c.bg0, bg = c.blue, bold = true })
h('MiniStatuslineModeVisual', { fg = c.bg0, bg = c.yellow, bold = true })
h('MiniStatuslineModeReplace', { fg = c.bg0, bg = c.red, bold = true })
h('MiniStatuslineModeCommand', { fg = c.bg0, bg = c.aqua, bold = true })
h('MiniStatuslineDevinfo', { fg = c.fg, bg = c.bg2 })
h('MiniStatuslineFilename', { fg = c.fg, bg = c.bg1 })
h('MiniStatuslineFileinfo', { fg = c.fg, bg = c.bg2 })
h('MiniStatuslineInactive', { fg = c.grey0 })

-- Tabline
h('MiniTablineCurrent', { fg = c.fg, bg = c.bg4, bold = true })
h('MiniTablineVisible', { fg = c.fg, bg = c.bg2 })
h('MiniTablineHidden', { fg = c.grey1, bg = c.bg2 })
h('MiniTablineModifiedCurrent', { fg = c.blue, bg = c.bg4, bold = true })
h('MiniTablineModifiedVisible', { fg = c.blue, bg = c.bg2 })
h('MiniTablineModifiedHidden', { fg = c.grey1, bg = c.bg2 })
h('MiniTablineFill', { bg = c.bg0 })

-- Notify
h('MiniNotifyNormal', { fg = c.fg, bg = c.bg0 })
h('MiniNotifyBorder', { fg = c.grey1, bg = c.bg0 })
h('MiniNotifyTitle', { fg = c.blue, bold = true })

-- Pick
h('MiniPickNormal', { fg = c.fg, bg = c.bg0 })
h('MiniPickBorder', { fg = c.grey1, bg = c.bg0 })
h('MiniPickPrompt', { fg = c.blue, bold = true })
h('MiniPickMatchCurrent', { bg = c.bg2 })
h('MiniPickPreviewLine', { bg = c.bg2 })
h('MiniPickPreviewRegion', { bg = c.bg3 })

-- Files
h('MiniFilesNormal', { fg = c.fg, bg = c.bg0 })
h('MiniFilesBorder', { fg = c.grey1, bg = c.bg0 })
h('MiniFilesCursorLine', { bg = c.bg2 })
h('MiniFilesDirectory', { fg = c.blue })
h('MiniFilesFile', { fg = c.fg })
h('MiniFilesTitle', { fg = c.blue, bold = true })
h('MiniFilesTitleFocused', { fg = c.bg0, bg = c.blue, bold = true })

-- Clue
h('MiniClueNormal', { fg = c.fg, bg = c.bg0 })
h('MiniClueBorder', { fg = c.grey1, bg = c.bg0 })
h('MiniClueTitle', { fg = c.blue, bold = true })
h('MiniClueDescGroup', { fg = c.yellow, bold = true })
h('MiniClueNextKey', { fg = c.green, bold = true })

-- Indentscope
h('MiniIndentscopeSymbol', { fg = c.grey1 })
h('MiniIndentscopePrefix', { nocombine = true })

-- Cursorword
h('MiniCursorword', { underline = true })
h('MiniCursorwordCurrent', { underline = true })

-- Completion
h('MiniCompletionActiveParameter', { underline = true })

-- Jump
h('MiniJump', { fg = c.bg0, bg = c.purple, bold = true })
h('MiniJump2dSpot', { fg = c.orange, bold = true, nocombine = true })

--------------------------------------------------
-- Extra packs support
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

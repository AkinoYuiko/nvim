-- everforest-dark-hard.lua
vim.cmd("highlight clear")
vim.o.termguicolors = true
vim.g.colors_name = "everforest-dark-hard"

--------------------------------------------------
-- Palette (official dark hard)
--------------------------------------------------
local c = {
  bg0="#272e33", bg1="#2e383c", bg2="#374145", bg3="#404c51",
  fg="#d3c6aa",

  grey="#859289",
  red="#e67e80",
  orange="#e69875",
  yellow="#dbbc7f",
  green="#a7c080",
  aqua="#83c092",
  blue="#7fbbb3",
  purple="#d699b6",
}

local h=function(g,o)vim.api.nvim_set_hl(0,g,o)end

--------------------------------------------------
-- Core UI (transparent_background = 2)
--------------------------------------------------
h("Normal",{fg=c.fg})
h("NormalNC",{fg=c.fg})
h("SignColumn",{fg=c.fg})
h("EndOfBuffer",{fg=c.bg0})

h("CursorLine",{bg=c.bg1})
h("CursorColumn",{bg=c.bg1})
h("Visual",{bg=c.bg2})

h("LineNr",{fg=c.grey})
h("CursorLineNr",{fg=c.yellow,bold=true})

h("StatusLine",{fg=c.fg,bg=c.bg1})
h("StatusLineNC",{fg=c.grey,bg=c.bg0})

h("WinSeparator",{fg=c.bg3})
h("VertSplit",{link="WinSeparator"})

h("ColorColumn",{bg=c.bg1})

h("Folded",{fg=c.grey,bg=c.bg1})
h("FoldColumn",{fg=c.grey})

h("MatchParen",{fg=c.orange,bold=true})

--------------------------------------------------
-- Popup / Menu
--------------------------------------------------
h("Pmenu",{fg=c.fg,bg=c.bg0})
h("PmenuSel",{fg=c.bg0,bg=c.blue})
h("PmenuSbar",{bg=c.bg1})
h("PmenuThumb",{bg=c.grey})

--------------------------------------------------
-- Search
--------------------------------------------------
h("Search",{fg=c.bg0,bg=c.yellow})
h("IncSearch",{fg=c.bg0,bg=c.orange})

--------------------------------------------------
-- Syntax (official semantics)
--------------------------------------------------
h("Comment",{fg=c.grey,italic=true})

h("Identifier",{fg=c.blue})
h("Function",{fg=c.blue})

h("Constant",{fg=c.orange})
h("String",{fg=c.green})
h("Character",{fg=c.green})

h("Number",{fg=c.purple})
h("Boolean",{fg=c.purple})
h("Float",{fg=c.purple})

h("Type",{fg=c.yellow})
h("Keyword",{fg=c.red})
h("Statement",{fg=c.red})

h("Operator",{fg=c.fg})
h("PreProc",{fg=c.aqua})

--------------------------------------------------
-- Treesitter
--------------------------------------------------
h("@variable",{fg=c.fg})
h("@variable.builtin",{fg=c.orange})

h("@function",{fg=c.blue})
h("@function.builtin",{fg=c.aqua})

h("@constant",{fg=c.orange})
h("@constant.builtin",{fg=c.orange})

h("@string",{fg=c.green})
h("@number",{fg=c.purple})
h("@boolean",{fg=c.purple})

h("@type",{fg=c.yellow})
h("@keyword",{fg=c.red})
h("@operator",{fg=c.fg})

h("@comment",{link="Comment"})

--------------------------------------------------
-- Diff / Git
--------------------------------------------------
h("DiffAdd",{fg=c.green})
h("DiffChange",{fg=c.blue})
h("DiffDelete",{fg=c.red})
h("DiffText",{fg=c.yellow,bold=true})

--------------------------------------------------
-- Diagnostics / Messages
--------------------------------------------------
h("DiagnosticError",{fg=c.red})
h("DiagnosticWarn",{fg=c.yellow})
h("DiagnosticInfo",{fg=c.blue})
h("DiagnosticHint",{fg=c.aqua})

h("ErrorMsg",{fg=c.red,bold=true})
h("MoreMsg",{fg=c.green})

--------------------------------------------------
-- Spell
--------------------------------------------------
h("SpellBad",{undercurl=true,sp=c.red})
h("SpellCap",{undercurl=true,sp=c.yellow})

--------------------------------------------------
-- mini.nvim (FULL)
--------------------------------------------------
h("MiniStatuslineModeNormal",{fg=c.bg0,bg=c.blue,bold=true})
h("MiniStatuslineModeInsert",{fg=c.bg0,bg=c.green,bold=true})
h("MiniStatuslineModeVisual",{fg=c.bg0,bg=c.purple,bold=true})
h("MiniStatuslineModeReplace",{fg=c.bg0,bg=c.red,bold=true})
h("MiniStatuslineModeCommand",{fg=c.bg0,bg=c.yellow,bold=true})
h("MiniStatuslineInactive",{fg=c.grey,bg=c.bg0})

h("MiniTablineCurrent",{fg=c.fg,bg=c.bg1,bold=true})
h("MiniTablineVisible",{fg=c.fg,bg=c.bg0})
h("MiniTablineHidden",{fg=c.grey,bg=c.bg0})
h("MiniTablineModified",{fg=c.orange,bg=c.bg0})

h("MiniIndentscopeSymbol",{fg=c.grey})
h("MiniIndentscopePrefix",{nocombine=true})

h("MiniNotifyNormal",{fg=c.fg,bg=c.bg0})
h("MiniNotifyBorder",{fg=c.grey,bg=c.bg0})

h("MiniPickNormal",{fg=c.fg,bg=c.bg0})
h("MiniPickBorder",{fg=c.grey,bg=c.bg0})
h("MiniPickPrompt",{fg=c.blue,bold=true})
h("MiniPickMatch",{fg=c.orange,bold=true})

h("MiniFilesNormal",{fg=c.fg,bg=c.bg0})
h("MiniFilesBorder",{fg=c.grey,bg=c.bg0})
h("MiniFilesTitle",{fg=c.blue,bold=true})

h("MiniClueNormal",{fg=c.fg,bg=c.bg0})
h("MiniClueBorder",{fg=c.grey,bg=c.bg0})
h("MiniClueTitle",{fg=c.yellow,bold=true})

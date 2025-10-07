local M = {}
local c = require("frisch.colors")

function M.setup(variant)
  variant = variant or "dark"

  -- Reset highlighting
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "nord"

  local colors = {}

  if variant == "dark" then
    -- Dark variant (original Nord theme)
    colors = {
      bg = c.nord0,
      bg_alt = c.nord1,
      bg_highlight = c.nord2,
      bg_visual = c.nord2,
      border = c.nord3,
      fg = c.nord4,
      fg_alt = c.nord5,
      fg_bright = c.nord6,

      -- Syntax colors
      comment = c.nord3,
      cyan = c.nord7,
      blue = c.nord9,
      blue_bright = c.nord8,
      blue_dark = c.nord10,
      red = c.nord11,
      orange = c.nord12,
      yellow = c.nord13,
      green = c.nord14,
      purple = c.nord15,
    }
  else
    -- Light variant
    colors = {
      bg = c.nord6,
      bg_alt = c.nord5,
      bg_highlight = c.nord4,
      bg_visual = c.nord4,
      border = c.nord3,
      fg = c.nord0,
      fg_alt = c.nord1,
      fg_bright = c.nord2,

      -- Syntax colors (same as dark)
      comment = c.nord3,
      cyan = c.nord7,
      blue = c.nord9,
      blue_bright = c.nord8,
      blue_dark = c.nord10,
      red = c.nord11,
      orange = c.nord12,
      yellow = c.nord13,
      green = c.nord14,
      purple = c.nord15,
    }
  end

  -- Helper function to set highlights
  local function hi(group, opts)
    local cmd = "highlight " .. group
    if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
    if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
    if opts.sp then cmd = cmd .. " guisp=" .. opts.sp end
    if opts.style then cmd = cmd .. " gui=" .. opts.style end
    if opts.link then cmd = "highlight! link " .. group .. " " .. opts.link end
    vim.cmd(cmd)
  end

  -- Editor highlights
  hi("Normal", { fg = colors.fg, bg = colors.bg })
  hi("NormalFloat", { fg = colors.fg, bg = colors.bg_alt })
  hi("NormalNC", { fg = colors.fg, bg = colors.bg })
  hi("LineNr", { fg = colors.comment, bg = colors.bg })
  hi("CursorLine", { bg = colors.bg_alt })
  hi("CursorLineNr", { fg = colors.fg, bg = colors.bg_alt })
  hi("ColorColumn", { bg = colors.bg_alt })
  hi("SignColumn", { fg = colors.comment, bg = colors.bg })
  hi("FoldColumn", { fg = colors.comment, bg = colors.bg })
  hi("Folded", { fg = colors.comment, bg = colors.bg_alt })
  hi("Visual", { bg = colors.bg_visual })
  hi("VisualNOS", { bg = colors.bg_visual })
  hi("Search", { fg = colors.bg, bg = colors.yellow })
  hi("IncSearch", { fg = colors.bg, bg = colors.orange })
  hi("CurSearch", { fg = colors.bg, bg = colors.orange })
  hi("Substitute", { fg = colors.bg, bg = colors.yellow })
  hi("MatchParen", { fg = colors.cyan, style = "bold" })
  hi("Conceal", { fg = colors.comment })
  hi("Cursor", { fg = colors.bg, bg = colors.fg })
  hi("lCursor", { link = "Cursor" })
  hi("CursorIM", { link = "Cursor" })
  hi("TermCursor", { link = "Cursor" })
  hi("TermCursorNC", { fg = colors.bg, bg = colors.comment })

  -- Window elements
  hi("VertSplit", { fg = colors.border, bg = colors.bg })
  hi("WinSeparator", { fg = colors.border, bg = colors.bg })
  hi("StatusLine", { fg = colors.fg, bg = colors.bg_alt })
  hi("StatusLineNC", { fg = colors.comment, bg = colors.bg_alt })
  hi("TabLine", { fg = colors.comment, bg = colors.bg_alt })
  hi("TabLineFill", { bg = colors.bg_alt })
  hi("TabLineSel", { fg = colors.cyan, bg = colors.bg })
  hi("WinBar", { fg = colors.fg, bg = colors.bg })
  hi("WinBarNC", { fg = colors.comment, bg = colors.bg })

  -- Popup menu
  hi("Pmenu", { fg = colors.fg, bg = colors.bg_alt })
  hi("PmenuSel", { fg = colors.cyan, bg = colors.bg_highlight })
  hi("PmenuSbar", { bg = colors.bg_highlight })
  hi("PmenuThumb", { bg = colors.comment })

  -- Messages
  hi("ErrorMsg", { fg = colors.red })
  hi("WarningMsg", { fg = colors.yellow })
  hi("ModeMsg", { fg = colors.fg })
  hi("MoreMsg", { fg = colors.cyan })
  hi("Question", { fg = colors.fg })

  -- Diff
  hi("DiffAdd", { fg = colors.green, bg = colors.bg_alt })
  hi("DiffChange", { fg = colors.yellow, bg = colors.bg_alt })
  hi("DiffDelete", { fg = colors.red, bg = colors.bg_alt })
  hi("DiffText", { fg = colors.blue, bg = colors.bg_highlight })

  -- Spell
  hi("SpellBad", { sp = colors.red, style = "undercurl" })
  hi("SpellCap", { sp = colors.yellow, style = "undercurl" })
  hi("SpellLocal", { sp = colors.cyan, style = "undercurl" })
  hi("SpellRare", { sp = colors.purple, style = "undercurl" })

  -- Syntax highlighting
  hi("Comment", { fg = colors.comment, style = "italic" })
  hi("Constant", { fg = colors.fg })
  hi("String", { fg = colors.green })
  hi("Character", { fg = colors.green })
  hi("Number", { fg = colors.purple })
  hi("Boolean", { fg = colors.blue })
  hi("Float", { fg = colors.purple })
  hi("Identifier", { fg = colors.fg })
  hi("Function", { fg = colors.cyan })
  hi("Statement", { fg = colors.blue })
  hi("Conditional", { fg = colors.blue })
  hi("Repeat", { fg = colors.blue })
  hi("Label", { fg = colors.blue })
  hi("Operator", { fg = colors.blue })
  hi("Keyword", { fg = colors.blue })
  hi("Exception", { fg = colors.blue })
  hi("PreProc", { fg = colors.blue })
  hi("Include", { fg = colors.blue })
  hi("Define", { fg = colors.blue })
  hi("Macro", { fg = colors.blue })
  hi("PreCondit", { fg = colors.blue })
  hi("Type", { fg = colors.blue })
  hi("StorageClass", { fg = colors.blue })
  hi("Structure", { fg = colors.blue })
  hi("Typedef", { fg = colors.blue })
  hi("Special", { fg = colors.cyan })
  hi("SpecialChar", { fg = colors.yellow })
  hi("Tag", { fg = colors.cyan })
  hi("Delimiter", { fg = colors.fg })
  hi("SpecialComment", { fg = colors.comment, style = "italic" })
  hi("Debug", { fg = colors.orange })
  hi("Underlined", { fg = colors.cyan, style = "underline" })
  hi("Ignore", { fg = colors.comment })
  hi("Error", { fg = colors.red, style = "bold" })
  hi("Todo", { fg = colors.yellow, style = "bold" })

  -- Treesitter highlights
  hi("@text.literal", { fg = colors.green })
  hi("@text.reference", { fg = colors.cyan })
  hi("@text.title", { fg = colors.blue, style = "bold" })
  hi("@text.uri", { fg = colors.cyan, style = "underline" })
  hi("@text.underline", { style = "underline" })
  hi("@text.todo", { fg = colors.yellow, style = "bold" })
  hi("@comment", { link = "Comment" })
  hi("@punctuation", { fg = colors.fg })
  hi("@constant", { link = "Constant" })
  hi("@constant.builtin", { fg = colors.blue })
  hi("@constant.macro", { link = "Define" })
  hi("@define", { link = "Define" })
  hi("@macro", { link = "Macro" })
  hi("@string", { link = "String" })
  hi("@string.escape", { fg = colors.yellow })
  hi("@string.special", { fg = colors.yellow })
  hi("@character", { link = "Character" })
  hi("@character.special", { link = "SpecialChar" })
  hi("@number", { link = "Number" })
  hi("@boolean", { link = "Boolean" })
  hi("@float", { link = "Float" })
  hi("@function", { link = "Function" })
  hi("@function.builtin", { fg = colors.cyan })
  hi("@function.macro", { link = "Macro" })
  hi("@parameter", { fg = colors.fg })
  hi("@method", { link = "Function" })
  hi("@field", { fg = colors.fg })
  hi("@property", { fg = colors.fg })
  hi("@constructor", { fg = colors.cyan })
  hi("@conditional", { link = "Conditional" })
  hi("@repeat", { link = "Repeat" })
  hi("@label", { link = "Label" })
  hi("@operator", { link = "Operator" })
  hi("@keyword", { link = "Keyword" })
  hi("@exception", { link = "Exception" })
  hi("@variable", { fg = colors.fg })
  hi("@variable.builtin", { fg = colors.blue })
  hi("@type", { link = "Type" })
  hi("@type.definition", { link = "Typedef" })
  hi("@type.builtin", { fg = colors.blue })
  hi("@namespace", { fg = colors.fg })
  hi("@include", { link = "Include" })
  hi("@preproc", { link = "PreProc" })
  hi("@debug", { link = "Debug" })
  hi("@tag", { link = "Tag" })

  -- LSP highlights
  hi("DiagnosticError", { fg = colors.red })
  hi("DiagnosticWarn", { fg = colors.yellow })
  hi("DiagnosticInfo", { fg = colors.cyan })
  hi("DiagnosticHint", { fg = colors.blue })
  hi("DiagnosticUnderlineError", { sp = colors.red, style = "undercurl" })
  hi("DiagnosticUnderlineWarn", { sp = colors.yellow, style = "undercurl" })
  hi("DiagnosticUnderlineInfo", { sp = colors.cyan, style = "undercurl" })
  hi("DiagnosticUnderlineHint", { sp = colors.blue, style = "undercurl" })
  hi("LspReferenceText", { bg = colors.bg_highlight })
  hi("LspReferenceRead", { bg = colors.bg_highlight })
  hi("LspReferenceWrite", { bg = colors.bg_highlight })

  -- Git signs
  hi("GitSignsAdd", { fg = colors.green })
  hi("GitSignsChange", { fg = colors.yellow })
  hi("GitSignsDelete", { fg = colors.red })
end

return M

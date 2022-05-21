
local Color, colors, Group, groups, styles = require('colorbuddy').setup()

vim.cmd[[colorscheme nord]]




Color.new('background', "#2E3440")
Color.new('fg', "#292929")
Color.new('nord_0', "#2E3440")
Color.new('nord_1',"#3B4252")
Color.new('nord_2', "#434C5E")
Color.new('nord_3', "#4C566A")
Color.new('nord_3_light', "#616E88")
Color.new('nord_4', "#D8DEE9")
Color.new('nord_5', "#E5E9F0")
Color.new('nord_6', "#ECEFF4")
Color.new('nord_7', "#8FBCBB")
Color.new('nord_8', "#88C0D0")
Color.new('nord_9', "#81A1C1")
Color.new('nord_10', "#5E81AC")
Color.new('nord_11', "#BF616A")
Color.new('nord_12', "#D08770")
Color.new('nord_13', "#EBCB8B")
Color.new('nord_14', "#A3BE8C")
Color.new('nord_15', "#B48EAD")

Color.new('white',     '#D8DEE9')
Color.new('red',       '#BF616A')
Color.new('green',     '#A3BE8C')
Color.new('yellow',    '#EBCB8B')
Color.new('blue',      '#81A1C1')
Color.new('aqua',      '#A3BE8C')
Color.new('cyan',      '#8FBCBB')
Color.new('purple',    '#B48EAD')
Color.new('violet',    '#B48EAD')
Color.new('orange',    '#D08770')



Group.new("WhichKeyFloat",colors.fg, colors.nord_1)
Group.new("WinSeparator", colors.nord_3, colors.none)


-- Group.new('VertSplit', colors.nord_2, colors.nord_2)
-- Group.new("Visual",colors.nord_4, colors.nord_9)
-- Group.new("VisualNOS",colors.nord_2, colors.nord_1)
-- Group.new('Conceal', colors.nord_3_light, colors.none)
-- Group.new("ColorColumn", colors.none, colors.nord_1)
-- Group.new("Cursor", colors.nord_0, colors.nord_4)
-- Group.new("CursorLine", colors.none, colors.none)
-- Group.new("iCursor",colors.nord_0, colors.nord_4)
-- Group.new("NormalFloat",colors.fg, colors.nord_1)
-- Group.new("DiagnosticWarn", colors.nord_13, colors.none)
-- Group.new("DiagnosticError", colors.nord_11, colors.none)
-- Group.new("DiagnosticInfo", colors.nord_8, colors.none)
-- Group.new("DiagnosticHint", colors.nord_10, colors.none)
-- Group.new("LSPReferenceText", colors.none, colors.none)
-- Group.new("LSPReferenceRead", colors.none, colors.none, styles.bold)
-- Group.new("LSPReferenceWrite", colors.nord_9, colors.none, styles.bold)
-- Group.new("markdownError", colors.nord_4, colors.none)
-- Group.new("CmpItemAbbrDefault", colors.nord_10, colors.none)
-- Group.new("CmpItemKind", colors.nord_10, colors.none)
-- Group.new("CmpItemMenu", colors.nord_10, colors.none)
-- Group.new('TabLineSel', colors.nord_0,  colors.nord_9, styles.italic )
-- Group.new('TabLineSelSeparator', colors.nord_9, colors.nord_0)
-- Group.new('TabLine', colors.fg, colors.nord_2)
-- Group.new('TabLineSeparator', colors.nord_2, colors.fg)
-- Group.new('TabLineFill', colors.none, colors.none)


